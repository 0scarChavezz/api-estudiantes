# API de Estudiantes

API REST desarrollada en Python con Flask que simula la gestión de una base de datos de estudiantes utilizando datos ficticios. Proporciona operaciones CRUD (Create, Read, Update, Delete) para la manipulación de registros académicos.

---

## 1. Tecnologías utilizadas

* Python 3.x
* Flask
* SQL Server
* pyodbc
* Render (plataforma de despliegue)

---

## 2. Estructura del proyecto

```
api-estudiantes/
│
├── app.py              # Punto de entrada de la aplicación
├── requirements.txt    # Dependencias del proyecto
├── Procfile            # Configuración de ejecución en Render
├── render.yaml         # Configuración del servicio en Render
└── estudiantes.sql     # Script de base de datos con datos de prueba
```

---

## 3. Configuración del entorno

### 3.1 Clonar el repositorio

```bash
git clone https://github.com/OscarChavezDev/api-estudiantes.git
cd api-estudiantes
```

### 3.2 Crear entorno virtual

```bash
python -m venv venv
```

Activación del entorno:

* Windows:

```bash
venv\Scripts\activate
```

* Linux / macOS:

```bash
source venv/bin/activate
```

### 3.3 Instalación de dependencias

```bash
pip install -r requirements.txt
```

---

## 4. Configuración de la base de datos

1. Crear una base de datos en SQL Server.
2. Ejecutar el archivo `estudiantes.sql` para generar la estructura y los datos iniciales.
3. Configurar la cadena de conexión en `app.py`:

```python
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=tu_servidor;'
    'DATABASE=tu_base_de_datos;'
    'UID=tu_usuario;'
    'PWD=tu_password'
)
```

---

## 5. Ejecución del proyecto

```bash
python app.py
```

La API se ejecutará en:

```
http://localhost:5000
```

---

## 6. Endpoints disponibles

### Obtener todos los estudiantes

```
GET /estudiantes
```

### Obtener un estudiante por ID

```
GET /estudiantes/<id>
```

### Crear un nuevo estudiante

```
POST /estudiantes
```

### Actualizar un estudiante

```
PUT /estudiantes/<id>
```

### Eliminar un estudiante

```
DELETE /estudiantes/<id>
```

---

## 7. Despliegue

El proyecto incluye configuración para despliegue en Render mediante:

* Procfile
* render.yaml

---

## 8. Consideraciones técnicas

* Las credenciales de base de datos no deben almacenarse directamente en el código fuente.
* Se recomienda el uso de variables de entorno para mayor seguridad.
* La API está diseñada con fines educativos y utiliza datos simulados.

---

## 9. Licencia

Proyecto orientado a uso académico y prácticas de desarrollo de APIs.
