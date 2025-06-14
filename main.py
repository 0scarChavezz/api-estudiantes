from flask import Flask, jsonify, request
import pyodbc
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
# Configuración de conexión
server = '64.20.37.138'
database = 'pruebita'
username = 'usergestion'
password = 'Gestion*ppp1'
connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};TrustServerCertificate=yes'

@app.route('/')
def home():
    return " API de estudiantes conectada"

@app.route('/estudiante/<codigo>', methods=['GET'])
def obtener_alumno(codigo):
    try:
        conn = pyodbc.connect(connection_string)
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM Estudiantes WHERE CodigoAlumno = ?", codigo)
        row = cursor.fetchone()

        if row:
            alumno = {
                "Id": row.Id,
                "CodigoAlumno": row.CodigoAlumno,
                "NombresAlumno": row.NombresAlumno,
                "ApellidosAlumno": row.ApellidosAlumno,
                "CorreoAlumno": row.CorreoAlumno,
                "CelularAlumno": row.CelularAlumno,
                "DniAlumno": row.DniAlumno,
                "TotalDeCreditos": row.TotalDeCreditos
            }
            cursor.close()
            conn.close()
            return jsonify(alumno)
        else:
            cursor.close()
            conn.close()
            return jsonify({"mensaje": "Alumno no encontrado"}), 404

    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
    
    
@app.route('/estudiante/<codigo>/total_creditos', methods=['GET'])
def obtener_TotalCreditos(codigo):
    try:
        conn = pyodbc.connect(connection_string)
        cursor = conn.cursor()

        cursor.execute("SELECT TotalDeCreditos FROM Estudiantes WHERE CodigoAlumno = ?", codigo)
        row = cursor.fetchone()

        if row:
            total_creditos = row.TotalDeCreditos
            cursor.close()
            conn.close()
            return jsonify({"TotalDeCreditos": total_creditos})
        else:
            cursor.close()
            conn.close()
            return jsonify({"mensaje": "Alumno no encontrado"}), 404

    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
    
    
    
    
# 🚀 Ejecutar en el puerto 8000 para evitar conflicto con XAMPP u otro backend
if __name__ == '__main__':
    app.run(debug=True, port=8000)