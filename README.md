# 🖥️ Script de Informe del Sistema en PowerShell

Este script de PowerShell genera un informe detallado del sistema donde se ejecuta. Es especialmente útil para personal de IT, técnicos de soporte o usuarios que desean conocer a fondo la información de su equipo de cómputo con solo ejecutar un archivo.

---

## 🧾 ¿Qué hace este script?

1. Obtiene y muestra la información básica del equipo: nombre, fabricante, modelo.
2. Recupera datos del BIOS: versión, fabricante y número de serie.
3. Identifica el procesador y cuenta sus núcleos físicos y lógicos.
4. Detecta la memoria RAM total instalada y los detalles de cada módulo.
5. Lista todos los discos duros: modelo, capacidad, tipo y número de serie.
6. Muestra la información del sistema operativo instalado.
7. Escanea las interfaces de red activas con detalles como IP, MAC, gateway y servidores DNS.
8. Genera un **archivo de texto** con toda esta información en el escritorio del usuario.

---

## 🧰 Requisitos

- Sistema operativo Windows.
- PowerShell 5.1 o superior.
- Permisos suficientes para acceder a la información del sistema.

---

## 💾 ¿Dónde se guarda el informe?

El informe se guarda automáticamente en el escritorio del usuario actual con el nombre:

```
Reporte-PC_YYYY-MM-DD_HH-mm.txt
```

Por ejemplo:
```
Reporte-PC_2025-07-15_16-58.txt
```

---

## 📂 Estructura del reporte generado

```
====================== INFORME DEL SISTEMA ======================
Fecha de generación: 15/07/2025 16:58:40
Autor: Enethel Mendoza

>> Equipo
  Nombre del equipo        : XXXXXX
  Fabricante               : HP
  Modelo                   : HP Laptop XXXX

>> BIOS
  Fabricante BIOS          : Insyde
  Versión BIOS             : F.44
  Número de serie          : XXXXXXXX

>> Procesador
  Nombre                   : Intel(R) Core(TM) i5-XXXX CPU
  Núcleos físicos          : 4
  Núcleos lógicos          : 8

>> Memoria RAM
  Total RAM instalada      : 7.89 GB
  - Banco: BANK 0, 8 GB, 2666 MHz, Kingston

>> Disco(s) duros
  - Modelo                 : WDC XXXXX
    Número de serie        : WD-XXXXXXX
    Tamaño                 : 500 GB
    Tipo de medio          : Fixed hard disk media

>> Sistema Operativo
  Nombre del SO            : Microsoft Windows 10 Home
  Versión                  : 10.0.19045
  Arquitectura             : 64-bit

>> Red
  Adaptador: Wi-Fi
    IP         : 192.168.1.100
    MAC        : XX-XX-XX-XX-XX-XX
    Gateway    : 192.168.1.1
    DNS        : 8.8.8.8, 8.8.4.4
```

---

## 🟢 ¿Cómo usar el script?

1. Copia el código en un archivo con extensión `.ps1`, por ejemplo:  
   `informe_sistema.ps1`

2. Ejecuta el script en PowerShell como administrador si es necesario.

3. Espera unos segundos. El archivo se guardará en tu escritorio.

---

## 📌 Autor

**Enethel Mendoza**

---

## 📝 Licencia

Este script puede ser usado, modificado y compartido libremente con fines personales o profesionales. Se recomienda conservar el crédito al autor.
