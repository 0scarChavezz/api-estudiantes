# API de Estudiantes

API REST sencilla desarrollada en **Python con Flask** que simula una base de datos de estudiantes usando **datos ficticios** almacenados en **SQL Server**. El proyecto permite consultar información académica básica de alumnos, como sus datos generales y el total de créditos acumulados.

## Descripción general

Este repositorio implementa una API orientada a pruebas y aprendizaje. La aplicación se conecta a una base de datos SQL Server, consulta registros de una tabla llamada `Estudiantes` y devuelve respuestas en formato JSON.

El proyecto incluye:

- Backend en **Flask**.
- Conexión a **SQL Server** mediante **pyodbc**.
- Soporte de **CORS** para permitir peticiones desde frontend u otros clientes.
- Variables de entorno para la configuración de conexión.
- Archivos para despliegue con **Docker**, **Gunicorn**, **Render** y **Procfile**.

## Objetivo del proyecto

El objetivo principal es exponer una API básica que permita consultar información de estudiantes a partir de una tabla SQL con registros de ejemplo. La estructura está pensada para practicar integración entre API, base de datos y despliegue.

La tabla `Estudiantes` contiene campos como:

- código del alumno
- nombres
- apellidos
- correo
- celular
- DNI
- total de créditos
- género

## Estructura del repositorio

El repositorio contiene los siguientes archivos principales:

- `main.py`: lógica principal de la API Flask y conexión a SQL Server.
- `SQLQuery1.sql`: script SQL para crear la tabla `Estudiantes` e insertar datos de prueba.
- `Dockerfile`: definición de la imagen Docker con dependencias del driver ODBC y ejecución con Gunicorn.
- `render.yaml`: configuración de despliegue para Render.
- `Procfile`: comando de inicio alternativo para despliegue.
- `API.txt`: lista manual de paquetes usados o considerados en el proyecto.
- `.gitignore`: exclusión de archivos no versionables.

## Tecnologías usadas

- Python
- Flask
- Flask-CORS
- pyodbc
- python-dotenv
- Gunicorn
- Docker
- SQL Server

## Base de datos

La base de datos utilizada en el script SQL se llama `pruebita` y contiene una tabla `Estudiantes` con registros ficticios. Cada registro incluye información académica y personal simulada de alumnos.

### Estructura de la tabla `Estudiantes`

Campos definidos en el script:

- `Id`
- `CodigoAlumno`
- `NombresAlumno`
- `ApellidosAlumno`
- `CorreoAlumno`
- `CelularAlumno`
- `DniAlumno`
- `TotalDeCreditos`
- `Genero`

## Endpoints identificados en el código

### 1. Ruta raíz

```http
GET /
```

Respuesta esperada:

```json
" API de estudiantes conectada"
```

Esta ruta sirve como verificación rápida de que la API está levantada.

### 2. Obtener datos de un estudiante

```http
GET /estudiante/{codigo}
```

La intención del código es consultar un alumno por `CodigoAlumno` y devolver un JSON con sus datos completos.

Ejemplo de respuesta esperada:

```json
{
  "Id": 1,
  "CodigoAlumno": "0020210001",
  "NombresAlumno": "Andres Felipe",
  "ApellidosAlumno": "Salinas Rojas",
  "CorreoAlumno": "andres.salinas@unas.edu.pe",
  "CelularAlumno": "987654321",
  "DniAlumno": "74478001",
  "TotalDeCreditos": 140,
  "Genero": "Masculino"
}
```

### 3. Obtener total de créditos de un estudiante

```http
GET /estudiante/{codigo}/total_creditos
```

El código también contempla una consulta específica para devolver solo el total de créditos de un estudiante.

Ejemplo de respuesta esperada:

```json
{
  "TotalDeCreditos": 140
}
```

## Funcionamiento general

La aplicación carga variables de entorno con `python-dotenv`, construye una cadena de conexión ODBC para SQL Server y ejecuta consultas SQL parametrizadas sobre la tabla `Estudiantes`. Las respuestas se entregan en formato JSON y los errores se manejan con códigos HTTP `404` o `500`, según corresponda.

## Ejecución local

### 1. Clonar el repositorio

```bash
git clone https://github.com/0scarChavezz/api-estudiantes.git
cd api-estudiantes
```

### 2. Instalar dependencias

De acuerdo con el código visible del proyecto, las dependencias principales son:

```bash
pip install flask pyodbc flask-cors python-dotenv gunicorn
```

### 3. Configurar variables de entorno

Crear un archivo `.env` con valores similares a estos:

```env
DB_SERVER=tu_servidor
DB_NAME=tu_base_de_datos
DB_USER=tu_usuario
DB_PASSWORD=tu_password
```

### 4. Ejecutar la aplicación

```bash
python main.py
```

La API está configurada para ejecutarse en el puerto `8000`.

## Ejecución con Docker

El `Dockerfile` usa la imagen `python:3.11-slim`, instala dependencias del sistema para ODBC, agrega el driver `msodbcsql17`, instala las librerías Python y levanta la app con Gunicorn en el puerto `8000`.

Comandos de referencia:

```bash
docker build -t api-estudiantes .
docker run -p 8000:8000 --env-file .env api-estudiantes
```

## Despliegue

El repositorio incluye archivos de despliegue para servicios tipo PaaS:

- `Procfile`: inicia la app con `gunicorn main:app`.
- `render.yaml`: define un servicio web llamado `api-estudiantes` y un comando de build que instala el driver ODBC y las dependencias de Python.

## Observaciones importantes sobre el estado actual del repositorio

Al revisar el contenido del repositorio, se observan varios puntos que conviene corregir para dejar el proyecto más sólido:

1. En `main.py`, las rutas de estudiante parecen estar definidas de forma incompleta, ya que no se aprecia correctamente el parámetro en la URL aunque la función sí recibe `codigo`.
2. `API.txt` menciona FastAPI y Uvicorn, pero el código principal implementado usa Flask, no FastAPI.
3. En `render.yaml` aparecen credenciales de base de datos visibles en texto plano, lo que representa un riesgo de seguridad y debería corregirse cuanto antes.
4. El script SQL termina con `DROP TABLE IF EXISTS Estudiantes;`, por lo que conviene revisar el orden real de ejecución antes de usarlo en un entorno de prueba.

## Posibles mejoras

- Corregir las rutas dinámicas de los endpoints.
- Agregar un `requirements.txt` limpio y consistente.
- Mover secretos fuera del repositorio.
- Añadir endpoints adicionales como listado completo, creación, actualización y eliminación de estudiantes.
- Incorporar validaciones, manejo de errores más detallado y documentación con Swagger o Postman.
- Separar configuración, conexión y rutas en módulos distintos para una estructura más profesional.

## Resumen

`api-estudiantes` es una API sencilla para consultar datos ficticios de estudiantes desde SQL Server. Actualmente funciona como un proyecto académico o de práctica orientado a demostrar conexión entre una aplicación Flask, una base de datos relacional y un posible despliegue con Docker o Render. El repositorio ya incluye la base del backend, el script SQL y archivos de despliegue, aunque también presenta detalles de estructura y seguridad que deberían corregirse para dejarlo más profesional.
