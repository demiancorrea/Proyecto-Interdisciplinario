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
ConectarBase()
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

def Turno_Insertar(Id_Cliente,Id_Servicios,Id_Empleados,Fecha,Hora,Estado):
    sql = "INSERT INTO turnos (Id_Cliente, Id_Servicios, Id_Empleados, Fecha, Hora, Estado)VALUES(%s,%s,%s,%s,%s,%s)"
    cursor.execute(sql, (Id_Cliente, Id_Servicios, Id_Empleados, Fecha, Hora, Estado))
    cnx.commit()
    return cursor.lastrowid

def Consulta_servicios():
    print("||||SERVICIOS||||")
    Consulta_servicios = "SELECT * FROM servicios;"
    cursor.execute(Consulta_servicios)
    for x in cursor:
        print(x)

def Consulta_empleados():
    print("||||EMPLEADOS||||")
    Consulta_empleados = "SELECT * FROM empleados;"
    cursor.execute(Consulta_empleados)
    for x in cursor:
        print(x)

def Consulta_clientes():
    print("||||CLIENTES||||")
    Consulta_clientes = "SELECT * FROM clientes;"
    cursor.execute(Consulta_clientes)
    for x in cursor:
        print(x)

def Registrar_Turno():
    Consulta_servicios()
    Consulta_empleados()
    Consulta_clientes()
    print("Ingrese los DATOS")
    Id_Cliente = int(input("ID del Cliente: "))
    Id_Servicios = int(input("ID del servicio: "))
    Id_Empleados = int(input("ID del empleado: "))
    Fecha = input("Ingrese la Fecha: ")
    Hora = input("Ingrese la hora: ")
    Estado = input("Ingrese El estado del Turno: ")
    Turno_Insertar(Id_Cliente,Id_Servicios,Id_Empleados,Fecha,Hora,Estado)
Registrar_Turno()



if cnx.is_connected():
    cnx.close()
    print("La conexión a la base de datos ha sido cerrada.")