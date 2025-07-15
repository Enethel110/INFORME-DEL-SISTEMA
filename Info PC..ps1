# Nombre del archivo de salida
$fecha = Get-Date -Format "yyyy-MM-dd_HH-mm"
$rutaSalida = "$env:USERPROFILE\Desktop\Reporte-PC_$fecha.txt"

# Encabezado
$contenido = @()
$contenido += "====================== INFORME DEL SISTEMA ======================"
$contenido += "Fecha de generación: $(Get-Date)"
$contenido += "Autor: Enethel Mendoza"
$contenido += "`n"

# Nombre del equipo y modelo
$compInfo = Get-CimInstance -ClassName Win32_ComputerSystem
$contenido += ">> Equipo"
$contenido += "  Nombre del equipo        : $($compInfo.Name)"
$contenido += "  Fabricante               : $($compInfo.Manufacturer)"
$contenido += "  Modelo                   : $($compInfo.Model)"
$contenido += "`n"

# Número de serie del sistema
$bios = Get-CimInstance -ClassName Win32_BIOS
$contenido += ">> BIOS"
$contenido += "  Fabricante BIOS          : $($bios.Manufacturer)"
$contenido += "  Versión BIOS             : $($bios.SMBIOSBIOSVersion)"
$contenido += "  Número de serie (equipo) : $($bios.SerialNumber)"
$contenido += "`n"

# Procesador
$cpu = Get-CimInstance Win32_Processor
$contenido += ">> Procesador"
$contenido += "  Nombre                   : $($cpu.Name)"
$contenido += "  Núcleos físicos          : $($cpu.NumberOfCores)"
$contenido += "  Núcleos lógicos          : $($cpu.NumberOfLogicalProcessors)"
$contenido += "`n"

# Memoria RAM
$contenido += ">> Memoria RAM"
$ram = Get-CimInstance Win32_PhysicalMemory
$totalRAM = ($ram | Measure-Object -Property Capacity -Sum).Sum / 1GB
$contenido += "  Total RAM instalada      : {0:N2} GB" -f $totalRAM
foreach ($modulo in $ram) {
    $contenido += "  - Banco: $($modulo.BankLabel), $($modulo.Capacity / 1GB) GB, $($modulo.Speed) MHz, $($modulo.Manufacturer)"
}
$contenido += "`n"

# Disco(s) duros
$contenido += ">> Disco(s) duros"
$discos = Get-CimInstance Win32_DiskDrive
foreach ($disco in $discos) {
    $tamGB = [math]::Round($disco.Size / 1GB, 2)
    $contenido += "  - Modelo                : $($disco.Model)"
    $contenido += "    Número de serie       : $($disco.SerialNumber)"
    $contenido += "    Tamaño                : $tamGB GB"
    $contenido += "    Tipo de medio         : $($disco.MediaType)"
}
$contenido += "`n"

# Sistema Operativo
$so = Get-CimInstance Win32_OperatingSystem
$contenido += ">> Sistema Operativo"
$contenido += "  Nombre del SO            : $($so.Caption)"
$contenido += "  Versión                  : $($so.Version)"
$contenido += "  Arquitectura             : $($so.OSArchitecture)"
$contenido += "`n"

# Red
$contenido += ">> Red"
$adaptadores = Get-NetIPConfiguration | Where-Object {$_.IPv4Address}
foreach ($adaptador in $adaptadores) {
    $contenido += "  Adaptador: $($adaptador.InterfaceAlias)"
    $contenido += "    IP         : $($adaptador.IPv4Address.IPAddress)"
    $contenido += "    MAC        : $($adaptador.MacAddress)"
    $contenido += "    Gateway    : $($adaptador.IPv4DefaultGateway.NextHop)"
    $contenido += "    DNS        : $($adaptador.DNSServer.ServerAddresses -join ', ')"
}
$contenido += "`n"

# Guardar archivo
$contenido | Out-File -FilePath $rutaSalida -Encoding utf8

Write-Host "`n✅ Informe generado correctamente en:`n$rutaSalida" -ForegroundColor Green
Start-Sleep -Seconds 5  # Espera opcional para que se vea el mensaje
exit

