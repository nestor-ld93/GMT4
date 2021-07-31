# GENERIC MAPPING TOOLS 4

[![Documentation (development version)](https://img.shields.io/badge/docs-development-green.svg)](http://docs.generic-mapping-tools.org/dev/)
[![GitHub release](https://img.shields.io/github/release/nestor-ld93/GMT4)](https://github.com/nestor-ld93/GMT4/releases)
[![GitHub oficial release](https://img.shields.io/badge/oficial-release-orange.svg)](https://www.generic-mapping-tools.org/download/)
[![The Founders](https://img.shields.io/badge/authors-blue.svg)](https://github.com/GenericMappingTools/gmt/blob/master/AUTHORS.md)

Se presenta la instalación^(1) de GMT^(2) (Generic Mapping Tools) de forma semi-desatendida,
mediante scripts funcionales para sistemas operativos basados en GNU/Linux Ubuntu
14.04 y superiores.

> Como aclaración, este es un repositorio no oficial de GMT4. Este espacio está dedicado
> a los usuarios que aún utilizan o necesitan la versión `legacy`.
> De todas maneras, recomiento el uso de los canales oficiales.

**NOTA 1:**
Mas detalles en el archivo `Instalación_GMT_v.4.5.14_rev1.2.pdf`.

**NOTA 2**
Se utiliza la versión `4.5.14`.

## Contenido

- [¿Qué es GMT?](#gmt)
- [Preparativos](#preparativos)
- [Clonando el repositorio](#clonando-el-repositorio)
- [Instalación](#instalacion)
  * [Instalación de NetCDF 3.6.3](#instalacion-de-netcdf-3.6.3)
  * [Instalación de GSHHG 2.2.4](#instalacion-de-gshhg-2.2.4)
  * [Instalación de GMT 4](#instalacion-de-gmt-4)
  * [Modificación de .bashrc](#Modificacion-de-.bashrc)
  * [Verificación](#Verificacion)
- [REFERENCIAS](#referencias)
- [RECONOCIMIENTO](#reconocimiento)

## ¿Qué es GMT?

`GMT` es un entorno de programación de código abierto (Open Source) utilizando
para la manipulación de conjunto de datos cartesianos y geográficos (incluyendo
filtrado, ajuste de tendencia, grillado, proyecciones, etc.) obteniéndose imágenes de
alta calidad en formato PS (Post Script) desde simples gráficos XY, mapas de contornos
hasta superficies iluminadas artificialmente y vistas en perspectivas 3D.

## Preparativos

La instalación de GMT requiere un sistema operativo GNU/Linux con ciertas
dependencias de compilación, como los lenguajes de programación `Fortran` y `C`. Por
tal motivo, iniciamos abriendo un terminal y digitando las siguientes instrucciones:

    sudo apt-get update
    sudo apt-get install libhdf5-serial-dev build-essential gcc gfortran
    sudo apt-get install csh make cmake

## Clonando el repositorio

Los archivos necesarios se encuentran en este repositorio, para descargarlos, ejecutar
el siguiente comando en un terminal:

    git clone https://github.com/nestor-ld93/GMT4
    cd GMT4

Los archivos necesarios son:

1. `install_gmt4.sh`
2. `install_netcdf.sh`
3. `GMT4param.txt`
4. `gmt-4.5.14-src.tar.bz2`
5. `gshhg-gmt-nc3-2.2.4.tar.bz2`
6. `netcdf-3.6.3.tar.Z`
7. `rm_instaladores.sh`

Crear el directorio de instalación. Como ejemplo, se creó la carpeta `gmt` en la
ubicación^(3) `/opt` de la siguiente manera^(4):

    sudo mkdir /opt; sudo mkdir /opt/gmt

**NOTA 3:**
Se recomienda utilizar la ubicación `/opt` por motivos de permisos del sistema y seguridad.

**NOTA 4:**
`sudo mkdir /opt;` debe ser omitido si la carpeta opt ya existe.

Ubicarse en la carpeta contenedora de los archivos descargados y copiarlos a
`/opt/gmt` con el siguiente comando:

    sudo cp install_gmt4.sh install_netcdf.sh GMT4param.txt gmt-4.5.14-src.tar.bz2 gshhg-gmt-nc3-2.2.4.tar.bz2 netcdf-3.6.3.tar.Z rm_instaladores.sh /opt/gmt

## Instalación

GMT requiere `NetCDF` y `GSHHG` para funcionar. El primero es instalado de forma
independiente, mientras que el segundo de forma automática durante el proceso
de instalación de GMT.

### Instalación de NetCDF 3.6.3

Abrir un terminal, ubicarse en la ruta `opt/gmt` y asignar permisos de ejecución
al script de instalación:

    cd /opt/gmt
    sudo chmod +x install_netcdf.sh

Posteriormente iniciar la instalación de `NetCDF`:

    sudo ./install_netcdf.sh

La compilación e instalación es de forma automática.

### Instalación de GSHHG 2.2.4

GSHHG es un conjunto de datos geográficos de alta resolución generado a partir
de dos bases de datos de dominio público: World Vector Shorelines (WVS) y CIA
World Data Bank II (WDBII). El primero es la base de las líneas de costa, mientras
que el segundo es la base de las fronteras políticas, ríos y lagos.
Como se mencionó, este proceso está incluído durante la instalación de GMT^(5).

**NOTA 5:**
Se eligió esta forma de instalación, el usuario final es libre de modificar el script
para una instalación separada.

### Instalación de GMT 4

Este paso normalmente requiere participación del usuario de forma continua,
para evitarlo, se creó un script de parámetros personalizados que permitirá una
instalación desantendida (`GMT4param.txt`).

Asignar permisos de ejecución e iniciar el instalador:

    sudo chmod +x install_gmt4.sh
    sudo ./install_gmt4.sh GMT4param.txt

Finalmente, una vez terminada la ejecución, GMT 4 se encontrará instalado
pero siendo aún inutilizable de forma directa.

Si lo desea, puede eliminar los instaladores^(6) contenidos en `/opt/gmt` de la siguiente
manera:

    sudo chmod +x rm_instaladores.sh
    sudo ./rm_instaladores.sh

**NOTA 6:**
Es seguro eliminarlos, no afectan la instalación y se liberará espacio.

### Modificación de .bashrc

El último paso es modificar el archivo oculto `.bashrc` ubicado en el directorio
personal. Para ello, abrir un nuevo terminal y utilizar^(7):

    gedit /home/usuario/.bashrc

**NOTA 7:**
Modificar `gedit` por el editor de texto preferido: `kate`, `kwrite`, `nano`, etc.
Modificar `usuario` por el nombre de usuario del equipo.

Se abrirá `.bashrc` en el editor de texto utilizado, agregar al final del contenido las
siguientes líneas:

    export PATH=$PATH:/opt/gmt/gmt-4.5.14/bin
    export MANPATH=$MANPATH:/opt/gmt/gmt-4.5.14/man
    export NETCDFHOME=/opt/gmt/netcdf-3.6.3

Guardar y cerrar el archivo.

### Verificación

Ubicarse en `/opt/gmt` y verificar que se encuentren alojadas las siguientes carpetas:

1. `gmt-4.5.14`
2. `gshhg-gmt-nc3-2.2.4`
3. `netcdf-3.6.3`

Si todo está bien, entonces proceder con lo siguiente.

Abrir un nuevo terminal^(8) y utilizar la siguiente sentencia:

    which pscoast

**NOTA 8:**
Es necesario abrir un nuevo terminal para que los cambios en .bashrc surtan efecto.

Dentro del mismo terminal, aparecerá como respuesta lo siguiente:

> "/opt/gmt/gmt-4.5.14/bin/pscoast"

Si todo salió bien, GMT es completamente funcional.

## REFERENCIAS

> GMT4 y documentación oficial de instalación. https://www.generic-mapping-tools.org/download/

> Wessel, P., Luis, J. F., Uieda, L., Scharroo, R., Wobbe, F., Smith, W. H. F., & Tian, D. (2019).
> The Generic Mapping Tools version 6. Geochemistry, Geophysics, Geosystems, 20, 5556–5564.
> https://doi.org/10.1029/2019GC008515

## RECONOCIMIENTO

GMT relies on several other Open Source software libraries, programs and data for its
operation.  We gratefully acknowledge the importance to GMT of these products.
GMT may be linked with these libraries (* means optional):

[Network Common Data Form (netCDF)](https://www.unidata.ucar.edu/software/netcdf/),
[Geospatial Data Abstraction Library (GDAL*)](https://gdal.org),
[Perl Compatible Regular Expressions (PCRE*)](https://www.pcre.org),
[Fastest Fourier Transform in the West (FFTW*)](http://www.fftw.org),
[Linear Algebra Package (LAPACK*)](http://www.netlib.org/lapack/),
[Basic Linear Algebra Subprograms (BLAS*)](http://www.netlib.org/blas/),
[GLIB*](https://developer.gnome.org/glib/), and
[ZLIB*](https://www.zlib.net). GMT may call these executables:
GDAL (ogr2ogr, gdal_translate), [Ghostscript](https://www.ghostscript.com),
[FFmpeg](https://www.ffmpeg.org),
[xdg-open](https://www.freedesktop.org/wiki/Software/xdg-utils/), and
[GraphicsMagick](http://www.graphicsmagick.org).

GMT uses (or can access) data derived from these sources:

- [Scientific Color Maps (CPT)](http://www.fabiocrameri.ch/visualisation.php)
- [Earth 15" DEM](http://dx.doi.org/10.1029/2019EA000658)
- [Earth 1" SRTM DEM](https://lpdaac.usgs.gov/products/srtmgl3v003)
- [Earth 1' crustal age](http://dx.doi.org/10.1029/2020GC009214)
- [Earth 30" Blue Marble images](https://visibleearth.nasa.gov/images/57752/blue-marble-land-surface-shallow-water-and-shaded-topography)
- [Earth 30" Black Marble images](https://earthobservatory.nasa.gov/features/NightLights/page3.php)
