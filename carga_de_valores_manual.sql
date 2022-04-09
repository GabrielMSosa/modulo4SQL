-- vamos a insertar los valores de usuario
-- TENEMOS QUE RESPETAR EL ORDEN DE CARGA YA QUE HAY TABLAS LIGADAS POR CLAVES FORAGNEAS Y SI EST
-- NO LA ENCUENTRA NO HAY FORMA QUE LA PUEDA VINCULAR Y TIRA ERROR.
-- VAMOS HACER EL INTENTO DE REPLICAR ESTA TABLA EN SPRING CON LAS NOTACION @ONETOMANY 



-- primero tabla usuario ya que el resto de las tablas necesitan el id del usuario ya que tenemos uno es usuario_id=1 
INSERT INTO portfolio3.usuario (nombre,apellido) values ('Gabriel Matias','Sosa');

INSERT INTO portfolio3.datosuser(id,telefono,email,edad,acercade,urlImg,usuario_id) values(1,'+543755261740','sosagabriel79@gmail.com',31,"Me encanta innovar, generar nuevas metodologias para mejorar procedimientos y siempre seguir aprendiendo.","https://drive.google.com/uc?id=1SV2lNnz2bJb5gKYnzlGuA4tgmJmHDRYf&export=download",1);

INSERT INTO portfolio3.credenciales(usuario,password,rol,datosuser_id,datosuser_usuario_id)  values('Gsosa','123456','ADMIN',1,1);

-- ahora vamos a las tablas de educacion
INSERT INTO portfolio3.edutiempo(id,fechaini,fechafin,estado,uriim) VALUES 
(0,2009,2018,'Graduado','./assets/FIO.PNG'),
(1,2021,2022,'Cursando','./assets/ArgPro.PNG'),
(2,2003,2009,"Graduado","./assets/comercio.PNG");

 INSERT INTO portfolio3.educacion(titulo,institucion,edutiempo_id,usuario_id) VALUES
 ('Ingeniero Electronico', 'Universidad Nacional de Misiones',0,1),
 ('Desarrollador Full Stacks', 'INTI Argentina Programa',1,1),
 ("Bachiller, Ciencias Naturales", "Escuela de Comercio N°19",2,1);
 
-- ahora vamos a las tablas de experiencias empezamos con las que no tengan vinculada un FK

INSERT INTO portfolio3.expeubi(id,localidad,provincia,pais,urlimg) VALUES
 (0,"Obera","Misiones","Argenina","https://drive.google.com/uc?id=1Amxg2KtDEIrzYRlMZkDnh1WZKRwi1PiJ&export=download"),
 (1,"Obera","Misiones","Argenina","./assets/voolkiaIt.png");
INSERT INTO portfolio3.expetiempo(id,empresa,fechaini,fechafin,deltaanio,expeubi_id) VALUES
(0,"CASINOS DE MISIONES S.A.","2017", "2021","4",0),
(1,"Voolkia IT ", "2021","2022","1",1);
INSERT INTO portfolio3.experiencia(id,trabajo,usuario_id,expetiempo_id) VALUES
(0,"Mantenimiento en tragamonedas",1,0),
(1,"Analista en Mercadolibre",1,1);
-- vamos a cargar idioma
INSERT INTO portfolio3.idiomadato(id,nivellectura,nivelescritura) VALUES
(0,"Muy avanzado","Basico"),
(1,"Bilingue","Muy avanzado");
INSERT INTO portfolio3.idioma(id,idioma,idiomadato_id,usuario_id) VALUES
(0,"Ingles",0,1),
(1,"Portugues",1,1);

-- vamos a cargar lenguaje  (URLIMG VAMOS A CAMBIAR A 255 CARACTERES)
INSERT INTO portfolio3.lenguajedato(id,info,nivel,urlimg) VALUES
  (0,"Manejo en aplicaciones WEB en el Frontend y en el backend","10%","/drive.google.com/uc?id=1mcUI1dyNwAM88aF6ZsnHjES405ZG4Mk4&export=download"),
  (1,"Manejo en aplicaciones WEB Frontend.","30%","/drive.google.com/uc?id=1jrjaOBr6EXk9mL9lddUBiUihYIRoib29&export=download"),
  (2,"Conocimiento medio realizando script de simulaciones y para procesar imagenes.","80%","/drive.google.com/uc?id=1YPl4o1XPm-o1jOwcAvsSOKrrddVUOgVT&export=download"),
  (3,"Diseño de Base de datos y realizando ABM.","60%","/drive.google.com/uc?id=1gLQ8ZzxY199Mr8BrTZcFu7B8oIloJFbG&export=download");

INSERT INTO portfolio3.lenguaje(id,lenguaje,lenguajedato_id,usuario_id) VALUES 
 (0,"HTML,Css,JavaScript",0,1),
 (1,"TypeScript",1,1),
 (2,"Python",2,1),
 (3,"MySQL",3,1);

