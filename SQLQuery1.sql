select * from Estudiantes


CREATE TABLE Estudiantes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CodigoAlumno VARCHAR(10) NOT NULL,
    NombresAlumno NVARCHAR(100) NOT NULL,
    ApellidosAlumno NVARCHAR(100) NOT NULL,
    CorreoAlumno NVARCHAR(150) NOT NULL,
    CelularAlumno VARCHAR(9),
    DniAlumno VARCHAR(8),
    TotalDeCreditos INT
);


INSERT INTO Estudiantes (CodigoAlumno, NombresAlumno, ApellidosAlumno, CorreoAlumno, CelularAlumno, DniAlumno, TotalDeCreditos)
VALUES
('0020210001', 'Andres Felipe', 'Salinas Rojas', 'andres.salinas@unas.edu.pe', '987654321', '74478001', 140),
('0020210002', 'Luisa Fernanda', 'Gamarra Diaz', 'luisa.gamarra@unas.edu.pe', '986543210', '74478002', 135),
('0020210003', 'Pedro Antonio', 'Arce Medina', 'pedro.arce@unas.edu.pe', '985432109', '74478003', 150),
('0020210004', 'Rosa Elena', 'Chacon Ruiz', 'rosa.chacon@unas.edu.pe', '984321098', '74478004', 145),
('0020220001', 'Mario Alberto', 'Paredes Leon', 'mario.paredes@unas.edu.pe', '983210987', '74478005', 138),
('0020220002', 'Carmen Rosa', 'Lujan Torres', 'carmen.lujan@unas.edu.pe', '982109876', '74478006', 155),
('0020220003', 'Diana Milagros', 'Vargas Soto', 'diana.vargas@unas.edu.pe', '981098765', '74478007', 144),
('0020220004', 'Jorge Luis', 'Ramirez Huerta', 'jorge.ramirez@unas.edu.pe', '980987654', '74478008', 142),
('0020230001', 'Valeria Paz', 'Huaman Cardenas', 'valeria.huaman@unas.edu.pe', '979876543', '74478009', 148),
('0020230002', 'Carlos Enrique', 'Rios Mendoza', 'carlos.rios@unas.edu.pe', '978765432', '74478010', 139),
('0020230003', 'Lucia Marlene', 'Quintana Reategui', 'lucia.quintana@unas.edu.pe', '977654321', '74478011', 137),
('0020230004', 'Bruno Alejandro', 'Sanchez Vega', 'bruno.sanchez@unas.edu.pe', '976543210', '74478012', 153),
('0020240001', 'Sandra Beatriz', 'Flores Torres', 'sandra.flores@unas.edu.pe', '975432109', '74478013', 146),
('0020240002', 'Julio Cesar', 'Meza Ramirez', 'julio.meza@unas.edu.pe', '974321098', '74478014', 135),
('0020240003', 'Tatiana Sofia', 'Leon Gutierrez', 'tatiana.leon@unas.edu.pe', '973210987', '74478015', 154),
('0020240004', 'Gabriel Andres', 'Cardenas Silva', 'gabriel.cardenas@unas.edu.pe', '972109876', '74478016', 141),
('0020250001', 'Fiorella Isabel', 'Ruiz Navarro', 'fiorella.ruiz@unas.edu.pe', '971098765', '74478017', 147),
('0020250002', 'Ricardo Javier', 'Bravo Zuniga', 'ricardo.bravo@unas.edu.pe', '970987654', '74478018', 150),
('0020250003', 'Natalia Estefania', 'Castro Ramos', 'natalia.castro@unas.edu.pe', '969876543', '74478019', 136),
('0020250004', 'Enzo Daniel', 'Poma Huertas', 'enzo.poma@unas.edu.pe', '968765432', '74478020', 149);


DROP TABLE IF EXISTS Estudiantes;
