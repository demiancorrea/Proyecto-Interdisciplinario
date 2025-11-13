import mysql.connector
from mysql.connector import errorcode

cursor = None
cnx = None

def ConectarBase():
    global cnx, cursor
    try:
        cnx = mysql.connector.connect(user="root", password="", host="Localhost", database="lavadero_de_autos")
        cursor = cnx.cursor(dictionary=True)
        print('Conexión establecida')


    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print('Usuario o contraseña incorrectos!')
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print('La base de datos no existe!')
        else:
            print(err)

def ConsultaSelect():
    Consulta = "SELECT * FROM clientes;"
    cursor.execute(Consulta)
    for x in cursor:
        print(x)


def ConsultaInsertar(nombre,patente,telefono,historial_lavados):
    sql = "INSERT INTO clientes (nombre, patente, teléfono, historial_lavados)VALUES( %s, %s, %s, %s)"
    cursor.execute(sql,(nombre,patente,telefono,historial_lavados))
    cnx.commit()
    return cursor.lastrowid

def insertar():
    historial_lavados = int
    print("Ingrese los DATOS")
    nombre = str(input("nombre: "))
    patente = str(input("patente: "))
    telefono = int(input("telefono: "))
    historial_lavados = 0
    ConsultaInsertar(nombre, patente, telefono, historial_lavados)
ConectarBase()
insertar()
ConsultaSelect()



if cnx.is_connected():
    cnx.close()
    print("La conexión a la base de datos ha sido cerrada.")