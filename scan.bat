#!/bin/bash

# Comprobamos si el script se está ejecutando en un entorno compatible
if [[ "$OSTYPE" != "cygwin" && "$OSTYPE" != "msys" && "$OSTYPE" != "win32" ]]; then
  echo "Este script debe ejecutarse en un entorno compatible con Windows, como WSL."
  exit 1
fi

# Ruta de registro
LOG_FILE="repair_windows8.log"

# Función para ejecutar un comando y registrar su salida
run_and_log() {
  echo "Ejecutando: $1"
  echo "[$(date)] Ejecutando: $1" >> "$LOG_FILE"
  eval "$1" >> "$LOG_FILE" 2>&1
  if [[ $? -eq 0 ]]; then
    echo "Comando completado con éxito."
    echo "[$(date)] Comando completado con éxito." >> "$LOG_FILE"
  else
    echo "Error al ejecutar el comando."
    echo "[$(date)] Error al ejecutar el comando." >> "$LOG_FILE"
  fi
}

# Análisis y reparación de archivos del sistema
echo "Iniciando análisis y reparación de archivos del sistema..."
run_and_log "sfc /scannow"

# Análisis del disco duro
echo "Iniciando análisis del disco duro..."
run_and_log "chkdsk C: /f /r"

# Restauración de la imagen del sistema
echo "Verificando la salud de la imagen del sistema..."
run_and_log "dism /online /cleanup-image /scanhealth"

echo "Intentando reparar la imagen del sistema..."
run_and_log "dism /online /cleanup-image /restorehealth"

# Finalización
echo "Proceso completado. Revisa el archivo de registro: $LOG_FILE"
