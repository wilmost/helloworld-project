#!/bin/bash

# Directorio donde se encuentran los archivos temporales
directorio="./"

# Obtener la fecha actual en el formato YYYYmmdd
fecha_actual=$(date "+%Y%m")

# Crear un patrón para encontrar archivos con la nomenclatura correcta para la fecha actual
patron="invoice_${fecha_actual}*_*.txt"

# Crear una lista de archivos que coincidan con el patrón
archivos_a_comprimir=($directorio/$patron)

# Verificar si hay archivos para comprimir
if [ ${#archivos_a_comprimir[@]} -eq 0 ]; then
  echo "No hay archivos para comprimir."
else
  # Crear un archivo comprimido con el nombre basado en la fecha actual
  tar -czvf "$directorio/invoice_$fecha_actual.tar.gz" "${archivos_a_comprimir[@]}"

  # Eliminar los archivos originales
  rm -f "${archivos_a_comprimir[@]}"

  echo "Archivos comprimidos y originales eliminados con éxito."
fi
