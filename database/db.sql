CREATE DATABASE chapin_market;

\c chapin_market;

CREATE SCHEMA schema_branch_offices;
CREATE SCHEMA schema_staff;
CREATE SCHEMA schema_inventory;
CREATE SCHEMA schema_sales;
CREATE SCHEMA schema_clients;


CREATE TABLE schema_branch_offices.branch_offices(
    branch_office_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL
);

CREATE TABLE schema_staff.employees_types (
    type_id SERIAL PRIMARY KEY,
    name_type varchar(50) NOT NULL
);


CREATE TABLE schema_staff.employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    employee_password VARCHAR(300) NOT NULL,
    branch_office_id INT NOT NULL REFERENCES schema_branch_offices.branch_offices(branch_office_id),
    employee_type INT NOT NULL REFERENCES schema_staff.employees_types(type_id)
);

CREATE TABLE schema_branch_offices.cash_registers (
    id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    CONSTRAINT fk_employee FOREIGN KEY(employee_id)
    REFERENCES schema_staff.employees(employee_id)
);

CREATE TABLE schema_inventory.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    product_state VARCHAR(30) DEFAULT true,
    brand VARCHAR(100) NOT NULL,
    branch_office_id INT NOT NULL REFERENCES schema_branch_offices.branch_offices(branch_office_id),
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE schema_clients.clients (
    nit VARCHAR(10) NOT NULL PRIMARY KEY,
    client_name VARCHAR(50) NOT NULL
);

CREATE TABLE schema_sales.bills (
    bill_id SERIAL PRIMARY KEY,
    bill_date DATE NOT NULL,
    client_nit VARCHAR(10) NOT NULL REFERENCES schema_clients.clients(nit),
    employee_id INT NOT NULL REFERENCES schema_staff.employees(employee_id),
    branch_office_id INT NOT NULL REFERENCES schema_branch_offices.branch_offices(branch_office_id),
    total_without_discount DECIMAL(10,2) NOT NULL,
    total_with_discount DECIMAL(10,2) NOT NULL
);

CREATE TABLE schema_sales.sales_details (
    detail_id SERIAL PRIMARY KEY,
    bill_id INT NOT NULL REFERENCES schema_sales.bills(bill_id),
    product_id INT NOT NULL REFERENCES schema_inventory.products(product_id),
    product_amount INT NOT NULL
);

CREATE TABLE schema_clients.cards_types (
    card_type_id SERIAL PRIMARY KEY,
    card_name VARCHAR(50) NOT NULL,
    points_per_req INT NOT NULL,
    requirements DECIMAL(10,2) NOT NULL,
    min_spent DECIMAL(10, 2) NOT NULL
);

CREATE TABLE schema_clients.clients_cards (
    client_nit VARCHAR(10) NOT NULL PRIMARY KEY REFERENCES schema_clients.clients(nit),
    card_id INT NOT NULL REFERENCES schema_clients.cards_types(card_type_id),
    current_spent DECIMAL(10, 2) NOT NULL
);

INSERT INTO schema_branch_offices.branch_offices(name, department)
VALUES ('Sucursal Central', 'Guatemala');

INSERT INTO schema_branch_offices.branch_offices(name, department)
VALUES ('Sucursal Norte', 'Petén');

INSERT INTO schema_branch_offices.branch_offices(name, department)
VALUES ('Sucursal Sur', 'Quetzaltenango');

INSERT INTO schema_staff.employees_types(name_type)
VALUES ('CAJERO'),('BODEGA'),('INVENTARIO'),('ADMINISTRADOR');

INSERT INTO schema_staff.employees(employee_name, user_name,employee_password, branch_office_id, employee_type)
VALUES ('Juan Mendoza','UserC1C','$2a$10$P5LBBfBeoy0dknZHLEEAkOHmWrjmb5kKj9J3MXMvUnohx0AnKOcHe',1,1),('Manuel Vásquez','UserC2C','$2a$10$WU1HSDSv1M3J04n66/69Duic2A0BsKwLMUqrfxj7FDvJz08pLZDfC',1,1),('Estefany Barrios','UserC3C','$2a$10$QlpFFbLG.qKdGx63O3r9xeqXnFoLkH8/jQOfZf/.aY0O9J2XJPdGO',1,1),
       ('Carlos Cifuentes','UserC4C','$2a$10$mclJAALvIA3y/7VWDeaqMe6/XWJUi7MSl4OU4CXVyRa4YVRgZC5KO',1,1),('Diego Costa','UserC5C','$2a$10$CI9C.hswprQ06xHExJk.FOBsbVGKeqMf4X6x63L3B8wZjnq0LuYP6',1,1),('Ricardo Mendoza','UserC6C','$2a$10$OGoGnyP.3OH0BODaQwrPuOtcadT13/m8WqPNtWF1EbKqDlgMI2RLG',1,1),
       ('Maria Sosa','UserN1C','$2a$10$9iI3ycJuV.hItOKIYN2F7eAHM2avw6qqEzcRaEzHq5Qlasb6n9seq',2,1),('Alex Ramírez','UserN2C','$2a$10$9b188HbeAVLxRGlXn1TCCeSH1RICrROw6XllbkEGbz5ODaTKz8W0C',2,1),('Wendy Estrada','UserN3C','$2a$10$9E87Kkw.QCI2YG.wenzwkOspo8PkxRABYWMNjd1JtzfbB2wzevy/O',2,1),
       ('Marco Martinez','UserN4C','$2a$10$p/i7K/fEVVAyxvs1Ef38kOOhn.1yQ8lR9ynV2QRGje.Ktawa3HxMm',2,1),('José Morales','UserN5C','$2a$10$CgpwCHjJxRplm68bqO2qReoFHHAYtOAqrnNrQtDEsVqtIaLT4A1.W',2,1),('William Ordóñez','UserN6C','$2a$10$ZS5fwqiU9j.q5nfVkGz5uO7V40FlWzL0LIifzgLHO.tc.tlsOux5q',2,1),
       ('Sofía Velasquez','UserS1C','$2a$10$CwKCVeuXQtyPYL3x6ziXt.MmqK1PmROk5OOPVtkad0iNe3Wc35/4e',3,1),('Carlos de Leon','UserS2C','$2a$10$XNDgsuKN0Oq7hFgcBiHOkOcQoktFhZhj1s2ZbU/UgV3BYcSOt1nz2',3,1),('Ernesto Gutierrez','UserS3C','$2a$10$GR7TcBg5SbY9Wz1VU5GwluprUMBfuHucFqSBQISfgSw.njSR5RyNG',3,1),
       ('Miriam Bolañoz','UserS4C','$2a$10$NFQpc3s6mxbn.Q1CtU9ZOOgkhhg//vB/l1K00iyvTAEzb/VZLngGW',3,1),('Miguel Choc','UserS5C','$2a$10$LwpR7u88XVXt3jD689clf./mAlZ8nH8RMXOsf4K60QDHGx0DcXMc2',3,1),('José Guzmán','UserS6C','$2a$10$oeaUV91Nuxfyg4gbq0h3GOgyCvvBNtmPTPaqCaxrBJizt8cSqJ/5W',3,1);

INSERT INTO schema_staff.employees(employee_name,user_name, employee_password, branch_office_id, employee_type)
VALUES ('Pablo Medina','UserC1I','$2a$10$HTQLzue0z/kt7PwW2yaQaOyf9MN2qK30fVqY6BhPhCbUkyaJWeUPy',1,3),('Ernesto de la Rosa','UserC2I','$2a$10$6EWEc0i0FQ4b44ATQhLTN.e95HaSQYTyLB.jS41X4XCmOiPiVjUOS',1,3),
       ('Paco Perez','UserC3I','$2a$10$RjdZgeeblO3InwUzjCwmYuxd8g63pF8rmq1DL.PTI2cz.Rf3qhzSi',1,3),('Pablo Cardona','UserC4I','$2a$10$w/hUMKVsi7krI.456NFiSui9z68Nib8pQjnYbMOPQcUzagLRVowge',1,3),
       ('Luis Mendoza','UserN1I','$2a$10$/CSKu18lYvR6KcBhpkbv0ufNLnk3/IYNrTzjS0Trt/ToSZ7hYY3Sy',2,3),('Bryan Ruiz','UserN2I','$2a$10$zWdjwn4hdNByLWFD1EX/QOAkQe0O/d6aldLFFEr0oax5yXdXvP57K',2,3),
       ('Laura Hernández','UserN3I','$2a$10$W9ZOL70/7JE/8sl3bDOfxOGJi31uxUt81m6MFV8gnKkzNI9FKkTT2',2,3),('Miguel Rivas','UserN4I','$2a$10$jwESdznA59.Zc2TLiKfzf.fYfNVaUGqMG9DQmqxN6.NzKnvXWdfze',2,3),
       ('Lois Lein','UserS1I','$2a$10$q.kASn7M.yN6pudwNYfIjO9WthhG0xSmajfPSIlqfBtV9qVMEI/9O',3,3),('Daniel Jiménez','UserS2I','$2a$10$k/UakZbwgYYC4pNl8TgbOeemHtHmUdTLg5Pbfg.7r/Az1ky71sKXO',3,3),
       ('Lucas Fernandez','UserS3I','$2a$10$e8XJsGGb1qFnMzU7PHfvXeQiErqsFJaolXq7IaQIcew.txbzZNLzG',3,3),('Erick Castro','UserS4I','$2a$10$P07MqCywo5yKTcTJUHGD9OSewkLixRAhlb5sw5iFlTTCFBXHB5.WS',3,3);

INSERT INTO schema_staff.employees(employee_name,user_name, employee_password, branch_office_id, employee_type)
VALUES ('Zury Martínez','UserC1B','$2a$10$68S.kytvLj0Y/zLIGuRh7eocTEJs4GGkn4GXNcbw9ZRtB8MFYs9Dy',1,2),
       ('Carlos Ríos','UserN1B','$2a$10$VTjahn2WzV.80VM3sCg8DO9lJ13R6eQihwxj2Nxp7POWyZhRLj7YG',2,2),
       ('Christian Ramírez','UserS1B','$2a$10$bPMn2Zw1QI9bEErzfxaIyOM1Do8q/HmUrb9VbN7ufuUC7krwAtz.a',3,2);

INSERT INTO schema_staff.employees(employee_name, user_name, employee_password, branch_office_id, employee_type)
VALUES ('Christina García','UserC1A','$2a$10$29sgBcyad.kkBEZ1fR2w3OnOkbyxrsa8/EJCCZ/TXoCbr1jKoOLNu',1,4),
       ('Moises Moralez','UserN1A','$2a$10$8xEhA4VErbQY4axNWv1pTuvb1zz5M.B9SWHZUcXB8oZ7NhZg9Cefi',2,4),
       ('Susana Gómez','UserS1A','$2a$10$4qnk64HMmroQJmVMyE8fW.QIJEaTOhRUQfuLn4kSKcBwp9kfdUyae',3,4);

INSERT INTO schema_branch_offices.cash_registers(employee_id)
VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18);

INSERT INTO schema_clients.clients(nit, client_name)
VALUES ('CF', 'sin nombre'),
       ('109749538', 'Pedro Álvarez'),
       ('135831143', 'Julia Pérez'),
       ('306214331', 'Carlos López'),
       ('907558831', 'José Torres'),
       ('694301956', 'María Granados'),
       ('495312209', 'Karla Matíaz'),
       ('867880432', 'Marcos Sandoval'),
       ('554931023', 'Edgar Santizo');

INSERT INTO schema_clients.cards_types(card_name, points_per_req, requirements, min_spent)
VALUES ('Común', 5, 200.00, 0),
       ('Oro', 10, 200.00, 10000.00),
       ('Platino', 20, 200.00, 20000.00),
       ('Diamante', 30, 200.00, 30000.00);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'BODEGA','La montaña', 1, 25.00),

       ('Sal', 'BODEGA', 'Suli', 1, 5.00),

       ('Margarina', 'BODEGA', 'Mazola', 1, 15.00),

       ('Arroz', 'BODEGA', 'Gallo Dorado', 1, 20.00),

       ('Aceite', 'BODEGA', 'Weson', 1, 25.00),

       ('Salchicha', 'BODEGA', 'Bremen', 1, 10.00),

       ('Helado de Vainilla', 'BODEGA', 'Foremost', 1, 35.00),

       ('Cloro', 'BODEGA', 'Magia blanca', 1, 15.00),

       ('Detergente', 'BODEGA', 'UltraKlin', 1, 5.00),

       ('Desinfectante', 'BODEGA', 'Fabuloso', 1, 12.50),

       ('Desinfectante', 'BODEGA', 'AJAX', 1, 17.50),

       ('Café clásico', 'BODEGA', 'NesCafé', 1, 50.00),

       ('Coca-Cola 3L', 'BODEGA', 'Coca-cola', 1, 15.00),

       ('Café instantáneo', 'BODEGA', 'Musun', 1, 25.00),

       ('Coca-cola lata', 'BODEGA', 'Coca-cola', 1, 5.00),

       ('Chocolate en polvo', 'BODEGA', 'Nesquik', 1, 15.00),

       ('Jugo coctel picante', 'BODEGA', 'Marinero', 1, 5.00),

       ('Jugo de naranja con pulpa', 'BODEGA', 'La Granja', 1, 15.00),

       ('Gaseosa en lata', 'BODEGA', 'Salutaris', 1, 5.00),

       ('Queso crema', 'BODEGA', 'Philadelphia', 1, 15.00),

       ('Huevo blanco', 'BODEGA', 'GuateHuevo', 1, 10.00),

       ('Jamón de pavo', 'BODEGA', 'Toledo', 1, 16.50),

       ('Jamón de pavo', 'BODEGA', 'Fud', 1, 15.00),

       ('Salchicha polaca', 'BODEGA', 'Santa lucía', 1, 25.00),

       ('Salami', 'BODEGA', 'Bremen', 1, 15.00),

       ('Chorizo colorado', 'BODEGA', 'Santa lucía', 1, 23.50),

       ('Jamón de pavo', 'BODEGA', 'Chimex', 1, 25.00),

       ('Alas de pollo', 'BODEGA', 'Pollo rey', 1, 3.00),

       ('Tortita de pollo', 'BODEGA', 'Pollo rey', 1, 2.00),

       ('Pechuga de pollo', 'BODEGA', 'Pollo pio', 1, 35.00),

       ('Pollo ahumado', 'BODEGA', 'Pio lindo', 1, 25.00),

       ('Torta de res', 'BODEGA', 'Corte sano', 1, 25.00),

       ('Chuleta ahumada', 'BODEGA', 'Don cristobal', 1, 25.00),

       ('Carne molida de pollo', 'BODEGA', 'Pollo rey', 1, 20.00),

       ('Papel higiénico', 'BODEGA', 'Suli', 1, 20.00),

       ('Pasta dental max white', 'BODEGA', 'Colgate', 1, 15.00),

       ('Pasta dental triple acción', 'BODEGA', 'Colgate', 1, 12.00),

       ('Papel higiénico triple hoja', 'BODEGA', 'Rosal morado', 1, 100.00),

       ('Jabón líquido', 'BODEGA', 'Olimpo', 1, 6.75),

       ('Barra antitraspirante', 'BODEGA', 'Old spice', 1, 15.00),

       ('Enjuage bucal Plax Ice', 'BODEGA', 'Colgate', 1, 35.00),

       ('Gel for men', 'BODEGA', 'Ego', 1, 15.00),

       ('Jabón corporal', 'BODEGA', 'Protex',1 ,33.00),

       ('Licuadora', 'BODEGA', 'DuraBrand', 1, 180.00),

       ('microondas', 'BODEGA', 'Acros', 1, 700.00),

       ('Plancha cerámica', 'BODEGA', 'Decker', 1, 200.00),

       ('Batidora de mano', 'BODEGA', 'DuraBrand', 1, 100.00),

       ('Ketchup', 'BODEGA', 'Essential', 1, 25.00),

       ('Medallones', 'BODEGA','Pollo rey', 1, 25.00),

       ('Mezcla para panqueques', 'BODEGA', 'Golden', 1, 15.00),

       ('Enjuague bucal', 'BODEGA', 'LISTERINE', 1, 25.00),

       ('Toalla femenina', 'BODEGA', 'kotex', 1, 12.40),

       ('Toalla femenina', 'BODEGA', 'Saba', 1, 15.00),

       ('Crema corporal', 'BODEGA', 'Nivea', 1, 50.00),

       ('Desodorante hombre', 'BODEGA', 'Nivea men', 1, 25.00),

       ('Pasta dental', 'BODEGA', 'Oral-B', 1, 35.00),

       ('Shampoo', 'BODEGA', 'ElVive', 1, 45.60),

       ('mantequilla de maní', 'BODEGA', 'B&B', 1, 20.00),

       ('Mermelada de mora', 'BODEGA', 'B&B', 1, 15.00),

       ('Leche entera', 'BODEGA', 'Dos pinos', 1, 20.00),

       ('Leche descremada', 'BODEGA',  'Dos pinos', 1 ,25.00),

       ('Leche de almendras', 'BODEGA', 'Dos pinos', 1, 27.00),

       ('Leche descremeda', 'BODEGA', 'Foremost', 1, 30.00),

       ('Yogurt Griego', 'BODEGA', 'Olkos', 1, 50.00),

       ('Crema dulce', 'BODEGA', 'Dos pinos', 1, 10.00),

       ('Leche entera', 'BODEGA', 'Lala', 1, 15.00),

       ('Leche descremada', 'BODEGA', 'Lala',1 ,17.00),

       ('Leche de almendra', 'BODEGA', 'Lala', 1, 23.75),

       ('Mayonesa', 'BODEGA','Mi patrona', 1, 12.00),

       ('Mostaza', 'BODEGA', 'Mi patrona', 1, 15.00),

       ('Mantequilla sin sal', 'BODEGA', 'President', 1, 15.00),

       ('Galletas cookies & cream', 'BODEGA', 'Oreo', 1, 20.00),

       ('Galletas de vainilla', 'BODEGA', 'Oreo', 1, 22.00),

       ('Frituras de limón', 'BODEGA', 'Tortrix', 1, 20.00),

       ('Frituras de barbacoa', 'BODEGA', 'Tortrix', 1, 20.00),

       ('Frituras taco chilero', 'BODEGA', 'Tortrix', 1, 25.00),

       ('Galletas de chocolate', 'BODEGA', 'Chocowow', 1, 15.00),

       ('Nachos de queso', 'BODEGA', 'Diana', 1, 8.00),

       ('Frituras queso y jalapeño', 'BODEGA', 'Doritos', 1, 15.00),

       ('Papalinas clásicas', 'BODEGA', 'Lays', 1, 10.00),

       ('Chocolates', 'BODEGA', 'Ferrero Rocher', 1, 75.00),

       ('Galleta relleno de fresa', 'BODEGA', 'Chiky', 1, 20.00),

       ('Jalapeños', 'BODEGA', 'Diana', 1, 10.00),

       ('Papalinas crema y cebolla', 'BODEGA', 'Pringles', 1, 56.00),

       ('Chicle de menta', 'BODEGA', 'Trident', 1, 15.00),

       ('Chocolate oscuro tableta', 'BODEGA', 'Granada', 1, 6.50),

       ('Nachos naturales', 'BODEGA', 'Ya está', 1, 23.75),

       ('Chocolate caramelo', 'BODEGA', 'Milka', 1, 25.25),

       ('Elotitos con limón', 'BODEGA','Diana', 1, 10.00),

       ('Botonetas Peanut', 'BODEGA', 'M&M', 1, 25.00),

       ('Chocolate strawberry', 'BODEGA', 'Milka', 1, 25.00),

       ('Maní japonés', 'BODEGA', 'Diana', 1, 7.50),

       ('Botonetas wild Berry', 'BODEGA', 'Skittles', 1, 10.25),

       ('Chocolate White', 'BODEGA', 'Kit Kat', 1, 10.00),

       ('Yuca barbacoa', 'BODEGA', 'Diana', 1, 16.25),

       ('Chocolate Dark', 'BODEGA', 'Kit Kat', 1, 7.75),

       ('Milk chocolate', 'BODEGA', 'Hersheys', 1, 15.00),

       ('Chocolate blanco polo nieve', 'BODEGA', 'Granada', 1, 5.75),

       ('Caramelo cereza', 'BODEGA', 'Halls', 1, 5.25),

       ('Galletas cremas', 'BODEGA', 'Pozuelo', 1, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'BODEGA','La montaña', 2, 25.00),

       ('Sal', 'BODEGA', 'Suli', 2, 5.00),

       ('Margarina', 'BODEGA', 'Mazola', 2, 15.00),

       ('Arroz', 'BODEGA', 'Gallo Dorado', 2, 20.00),

       ('Aceite', 'BODEGA', 'Weson', 2, 25.00),

       ('Salchicha', 'BODEGA', 'Bremen', 2, 10.00),

       ('Helado de Vainilla', 'BODEGA', 'Foremost', 2, 35.00),

       ('Cloro', 'BODEGA', 'Magia blanca', 2, 15.00),

       ('Detergente', 'BODEGA', 'UltraKlin', 2, 5.00),

       ('Desinfectante', 'BODEGA', 'Fabuloso', 2, 12.50),

       ('Desinfectante', 'BODEGA', 'AJAX', 2, 17.50),

       ('Café clásico', 'BODEGA', 'NesCafé', 2, 50.00),

       ('Coca-Cola 3L', 'BODEGA', 'Coca-cola', 2, 15.00),

       ('Café instantáneo', 'BODEGA', 'Musun', 2, 25.00),

       ('Coca-cola lata', 'BODEGA', 'Coca-cola', 2, 5.00),

       ('Chocolate en polvo', 'BODEGA', 'Nesquik', 2, 15.00),

       ('Jugo coctel picante', 'BODEGA', 'Marinero', 2, 5.00),

       ('Jugo de naranja con pulpa', 'BODEGA', 'La Granja', 2, 15.00),

       ('Gaseosa en lata', 'BODEGA', 'Salutaris', 2, 5.00),

       ('Queso crema', 'BODEGA', 'Philadelphia', 2, 15.00),

       ('Huevo blanco', 'BODEGA', 'GuateHuevo', 2, 10.00),

       ('Jamón de pavo', 'BODEGA', 'Toledo', 2, 16.50),

       ('Jamón de pavo', 'BODEGA', 'Fud', 2, 15.00),

       ('Salchicha polaca', 'BODEGA', 'Santa lucía', 2, 25.00),

       ('Salami', 'BODEGA', 'Bremen', 2, 15.00),

       ('Chorizo colorado', 'BODEGA', 'Santa lucía', 2, 23.50),

       ('Jamón de pavo', 'BODEGA', 'Chimex', 2, 25.00),

       ('Alas de pollo', 'BODEGA', 'Pollo rey', 2, 3.00),

       ('Chuleta ahumada', 'BODEGA', 'Don cristobal', 2, 25.00),

       ('Carne molida de pollo', 'BODEGA', 'Pollo rey', 2, 20.00),

       ('Papel higiénico', 'BODEGA', 'Suli', 2, 20.00),

       ('Pasta dental max white', 'BODEGA', 'Colgate', 2, 15.00),

       ('Pasta dental triple acción', 'BODEGA', 'Colgate', 2, 12.00),

       ('Papel higiénico triple hoja', 'BODEGA', 'Rosal morado', 2, 100.00),

       ('Jabón líquido', 'BODEGA', 'Olimpo', 2, 6.75),

       ('Barra antitraspirante', 'BODEGA', 'Old spice', 2, 15.00),

       ('Enjuage bucal Plax Ice', 'BODEGA', 'Colgate', 2, 35.00),

       ('Gel for men', 'BODEGA', 'Ego', 2, 15.00),

       ('Jabón corporal', 'BODEGA', 'Protex', 2, 33.00),

       ('mantequilla de maní', 'BODEGA', 'B&B', 2, 20.00),

       ('Mermelada de mora', 'BODEGA', 'B&B', 2, 15.00),

       ('Leche entera', 'BODEGA', 'Dos pinos', 2, 20.00),

       ('Leche descremada', 'BODEGA',  'Dos pinos', 2, 25.00),

       ('Leche de almendras', 'BODEGA', 'Dos pinos', 2, 27.00),

       ('Leche descremeda', 'BODEGA', 'Foremost', 2, 30.00),

       ('Yogurt Griego', 'BODEGA', 'Olkos', 2, 50.00),

       ('Crema dulce', 'BODEGA', 'Dos pinos', 2, 10.00),

       ('Leche entera', 'BODEGA', 'Lala', 2, 15.00),

       ('Leche descremada', 'BODEGA', 'Lala', 2, 17.00),

       ('Leche de almendra', 'BODEGA', 'Lala', 2, 23.75),

       ('Mayonesa', 'BODEGA','Mi patrona', 2, 12.00),

       ('Mostaza', 'BODEGA', 'Mi patrona', 2, 15.00),

       ('Mantequilla sin sal', 'BODEGA', 'President', 2, 15.00),

       ('Galletas cookies & cream', 'BODEGA', 'Oreo', 2, 20.00),

       ('Galletas de vainilla', 'BODEGA', 'Oreo', 2, 22.00),

       ('Frituras de limón', 'BODEGA', 'Tortrix', 2, 20.00),

       ('Frituras de barbacoa', 'BODEGA', 'Tortrix', 2, 20.00),

       ('Frituras taco chilero', 'BODEGA', 'Tortrix', 2, 25.00),

       ('Galletas de chocolate', 'BODEGA', 'Chocowow', 2, 15.00),

       ('Nachos de queso', 'BODEGA', 'Diana', 2, 8.00),

       ('Frituras queso y jalapeño', 'BODEGA', 'Doritos', 2, 15.00),

       ('Papalinas clásicas', 'BODEGA', 'Lays', 2, 10.00),

       ('Chocolates', 'BODEGA', 'Ferrero Rocher', 2, 75.00),

       ('Galleta relleno de fresa', 'BODEGA', 'Chiky', 2, 20.00),

       ('Jalapeños', 'BODEGA', 'Diana', 2, 10.00),

       ('Papalinas crema y cebolla', 'BODEGA', 'Pringles', 2, 56.00),

       ('Chicle de menta', 'BODEGA', 'Trident', 2, 15.00),

       ('Chocolate oscuro tableta', 'BODEGA', 'Granada', 2, 6.50),

       ('Nachos naturales', 'BODEGA', 'Ya está', 2, 23.75),

       ('Chocolate caramelo', 'BODEGA', 'Milka', 2, 25.25),

       ('Elotitos con limón', 'BODEGA','Diana', 2, 10.00),

       ('Botonetas Peanut', 'BODEGA', 'M&M', 2, 25.00),

       ('Chocolate strawberry', 'BODEGA', 'Milka', 2, 25.00),

       ('Yuca barbacoa', 'BODEGA', 'Diana', 2, 16.25),

       ('Galletas cremas', 'BODEGA', 'Pozuelo', 2, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'BODEGA','La montaña', 3, 25.00),

       ('Sal', 'BODEGA', 'Suli', 3, 5.00),

       ('Margarina', 'BODEGA', 'Mazola', 3, 15.00),

       ('Arroz', 'BODEGA', 'Gallo Dorado', 3, 20.00),

       ('Aceite', 'BODEGA', 'Weson', 3, 25.00),

       ('Salchicha', 'BODEGA', 'Bremen', 3, 10.00),

       ('Helado de Vainilla', 'BODEGA', 'Foremost', 3, 35.00),

       ('Cloro', 'BODEGA', 'Magia blanca', 3, 15.00),

       ('Detergente', 'BODEGA', 'UltraKlin', 3, 5.00),

       ('Desinfectante', 'BODEGA', 'Fabuloso', 3, 12.50),

       ('Desinfectante', 'BODEGA', 'AJAX', 3, 17.50),

       ('Café clásico', 'BODEGA', 'NesCafé', 3, 50.00),

       ('Coca-Cola 3L', 'BODEGA', 'Coca-cola', 3, 15.00),

       ('Café instantáneo', 'BODEGA', 'Musun', 3, 25.00),

       ('Coca-cola lata', 'BODEGA', 'Coca-cola', 3, 5.00),

       ('Chocolate en polvo', 'BODEGA', 'Nesquik', 3, 15.00),

       ('Jugo coctel picante', 'BODEGA', 'Marinero', 3, 5.00),

       ('Jugo de naranja con pulpa', 'BODEGA', 'La Granja', 3, 15.00),

       ('Gaseosa en lata', 'BODEGA', 'Salutaris', 3, 5.00),

       ('Queso crema', 'BODEGA', 'Philadelphia', 3, 15.00),

       ('Huevo blanco', 'BODEGA', 'GuateHuevo', 3, 10.00),

       ('Jamón de pavo', 'BODEGA', 'Toledo', 3, 16.50),

       ('Jamón de pavo', 'BODEGA', 'Fud', 3, 15.00),

       ('Salchicha polaca', 'BODEGA', 'Santa lucía', 3, 25.00),

       ('Salami', 'BODEGA', 'Bremen', 3, 15.00),

       ('Chorizo colorado', 'BODEGA', 'Santa lucía', 3, 23.50),

       ('Jamón de pavo', 'BODEGA', 'Chimex', 3, 25.00),

       ('Alas de pollo', 'BODEGA', 'Pollo rey', 3, 3.00),

       ('Chuleta ahumada', 'BODEGA', 'Don cristobal', 3, 25.00),

       ('Carne molida de pollo', 'BODEGA', 'Pollo rey', 3, 20.00),

       ('Papel higiénico', 'BODEGA', 'Suli', 3, 20.00),

       ('Pasta dental max white', 'BODEGA', 'Colgate', 3, 15.00),

       ('Pasta dental triple acción', 'BODEGA', 'Colgate', 3, 12.00),

       ('Papel higiénico triple hoja', 'BODEGA', 'Rosal morado', 3, 100.00),

       ('Jabón líquido', 'BODEGA', 'Olimpo', 3, 6.75),

       ('Barra antitraspirante', 'BODEGA', 'Old spice', 3, 15.00),

       ('Enjuage bucal Plax Ice', 'BODEGA', 'Colgate', 3, 35.00),

       ('Gel for men', 'BODEGA', 'Ego', 3, 15.00),

       ('Jabón corporal', 'BODEGA', 'Protex', 3, 33.00),

       ('mantequilla de maní', 'BODEGA', 'B&B', 3, 20.00),

       ('Mermelada de mora', 'BODEGA', 'B&B', 3, 15.00),

       ('Leche entera', 'BODEGA', 'Dos pinos', 3, 20.00),

       ('Leche descremada', 'BODEGA',  'Dos pinos', 3, 25.00),

       ('Leche de almendras', 'BODEGA', 'Dos pinos', 3, 27.00),

       ('Leche descremeda', 'BODEGA', 'Foremost', 3, 30.00),

       ('Yogurt Griego', 'BODEGA', 'Olkos', 3, 50.00),

       ('Crema dulce', 'BODEGA', 'Dos pinos', 3, 10.00),

       ('Leche entera', 'BODEGA', 'Lala', 3, 15.00),

       ('Leche descremada', 'BODEGA', 'Lala', 3, 17.00),

       ('Leche de almendra', 'BODEGA', 'Lala', 3, 23.75),

       ('Mayonesa', 'BODEGA','Mi patrona', 3, 12.00),

       ('Mostaza', 'BODEGA', 'Mi patrona', 3, 15.00),

       ('Mantequilla sin sal', 'BODEGA', 'President', 3, 15.00),

       ('Galletas cookies & cream', 'BODEGA', 'Oreo', 3, 20.00),

       ('Galletas de vainilla', 'BODEGA', 'Oreo', 3, 22.00),

       ('Frituras de limón', 'BODEGA', 'Tortrix', 3, 20.00),

       ('Frituras de barbacoa', 'BODEGA', 'Tortrix', 3, 20.00),

       ('Frituras taco chilero', 'BODEGA', 'Tortrix', 3, 25.00),

       ('Galletas de chocolate', 'BODEGA', 'Chocowow', 3, 15.00),

       ('Nachos de queso', 'BODEGA', 'Diana', 3, 8.00),

       ('Frituras queso y jalapeño', 'BODEGA', 'Doritos', 3, 15.00),

       ('Papalinas clásicas', 'BODEGA', 'Lays', 3, 10.00),

       ('Chocolates', 'BODEGA', 'Ferrero Rocher', 3, 75.00),

       ('Galleta relleno de fresa', 'BODEGA', 'Chiky', 3, 20.00),

       ('Jalapeños', 'BODEGA', 'Diana', 3, 10.00),

       ('Papalinas crema y cebolla', 'BODEGA', 'Pringles', 3, 56.00),

       ('Chicle de menta', 'BODEGA', 'Trident', 3, 15.00),

       ('Chocolate oscuro tableta', 'BODEGA', 'Granada', 3, 6.50),

       ('Nachos naturales', 'BODEGA', 'Ya está', 3, 23.75),

       ('Chocolate caramelo', 'BODEGA', 'Milka', 3, 25.25),

       ('Elotitos con limón', 'BODEGA','Diana', 3, 10.00),

       ('Botonetas Peanut', 'BODEGA', 'M&M', 3, 25.00),

       ('Chocolate strawberry', 'BODEGA', 'Milka', 3, 25.00),

       ('Yuca barbacoa', 'BODEGA', 'Diana', 3, 16.25),

       ('Galletas cremas', 'BODEGA', 'Pozuelo', 3, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'ESTANTERIA','La montaña', 1, 25.00),

       ('Sal', 'ESTANTERIA', 'Suli', 1, 5.00),

       ('Margarina', 'ESTANTERIA', 'Mazola', 1, 15.00),

       ('Arroz', 'ESTANTERIA', 'Gallo Dorado', 1, 20.00),

       ('Aceite', 'ESTANTERIA', 'Weson', 1, 25.00),

       ('Salchicha', 'ESTANTERIA', 'Bremen', 1, 10.00),

       ('Helado de Vainilla', 'ESTANTERIA', 'Foremost', 1, 35.00),

       ('Cloro', 'ESTANTERIA', 'Magia blanca', 1, 15.00),

       ('Detergente', 'ESTANTERIA', 'UltraKlin', 1, 5.00),

       ('Desinfectante', 'ESTANTERIA', 'Fabuloso', 1, 12.50),

       ('Desinfectante', 'ESTANTERIA', 'AJAX', 1, 17.50),

       ('Café clásico', 'ESTANTERIA', 'NesCafé', 1, 50.00),

       ('Coca-Cola 3L', 'ESTANTERIA', 'Coca-cola', 1, 15.00),

       ('Café instantáneo', 'ESTANTERIA', 'Musun', 1, 25.00),

       ('Coca-cola lata', 'ESTANTERIA', 'Coca-cola', 1, 5.00),

       ('Chocolate en polvo', 'ESTANTERIA', 'Nesquik', 1, 15.00),

       ('Jugo coctel picante', 'ESTANTERIA', 'Marinero', 1, 5.00),

       ('Jugo de naranja con pulpa', 'ESTANTERIA', 'La Granja', 1, 15.00),

       ('Gaseosa en lata', 'ESTANTERIA', 'Salutaris', 1, 5.00),

       ('Queso crema', 'ESTANTERIA', 'Philadelphia', 1, 15.00),

       ('Huevo blanco', 'ESTANTERIA', 'GuateHuevo', 1, 10.00),

       ('Jamón de pavo', 'ESTANTERIA', 'Toledo', 1, 16.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Fud', 1, 15.00),

       ('Salchicha polaca', 'ESTANTERIA', 'Santa lucía', 1, 25.00),

       ('Salami', 'ESTANTERIA', 'Bremen', 1, 15.00),

       ('Chorizo colorado', 'ESTANTERIA', 'Santa lucía', 1, 23.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Chimex', 1, 25.00),

       ('Alas de pollo', 'ESTANTERIA', 'Pollo rey', 1, 3.00),

       ('Tortita de pollo', 'ESTANTERIA', 'Pollo rey', 1, 2.00),

       ('Pechuga de pollo', 'ESTANTERIA', 'Pollo pio', 1, 35.00),

       ('Pollo ahumado', 'ESTANTERIA', 'Pio lindo', 1, 25.00),

       ('Torta de res', 'ESTANTERIA', 'Corte sano', 1, 25.00),

       ('Chuleta ahumada', 'ESTANTERIA', 'Don cristobal', 1, 25.00),

       ('Carne molida de pollo', 'ESTANTERIA', 'Pollo rey', 1, 20.00),

       ('Papel higiénico', 'ESTANTERIA', 'Suli', 1, 20.00),

       ('Pasta dental max white', 'ESTANTERIA', 'Colgate', 1, 15.00),

       ('Pasta dental triple acción', 'ESTANTERIA', 'Colgate', 1, 12.00),

       ('Papel higiénico triple hoja', 'ESTANTERIA', 'Rosal morado', 1, 100.00),

       ('Jabón líquido', 'ESTANTERIA', 'Olimpo', 1, 6.75),

       ('Barra antitraspirante', 'ESTANTERIA', 'Old spice', 1, 15.00),

       ('Enjuage bucal Plax Ice', 'ESTANTERIA', 'Colgate', 1, 35.00),

       ('Gel for men', 'ESTANTERIA', 'Ego', 1, 15.00),

       ('Jabón corporal', 'ESTANTERIA', 'Protex',1 ,33.00),

       ('Licuadora', 'ESTANTERIA', 'DuraBrand', 1, 180.00),

       ('microondas', 'ESTANTERIA', 'Acros', 1, 700.00),

       ('Plancha cerámica', 'ESTANTERIA', 'Decker', 1, 200.00),

       ('Batidora de mano', 'ESTANTERIA', 'DuraBrand', 1, 100.00),

       ('Ketchup', 'ESTANTERIA', 'Essential', 1, 25.00),

       ('Medallones', 'ESTANTERIA','Pollo rey', 1, 25.00),

       ('Mezcla para panqueques', 'ESTANTERIA', 'Golden', 1, 15.00),

       ('Enjuague bucal', 'ESTANTERIA', 'LISTERINE', 1, 25.00),

       ('Toalla femenina', 'ESTANTERIA', 'kotex', 1, 12.40),

       ('Toalla femenina', 'ESTANTERIA', 'Saba', 1, 15.00),

       ('Crema corporal', 'ESTANTERIA', 'Nivea', 1, 50.00),

       ('Desodorante hombre', 'ESTANTERIA', 'Nivea men', 1, 25.00),

       ('Pasta dental', 'ESTANTERIA', 'Oral-B', 1, 35.00),

       ('Shampoo', 'ESTANTERIA', 'ElVive', 1, 45.60),

       ('mantequilla de maní', 'ESTANTERIA', 'B&B', 1, 20.00),

       ('Mermelada de mora', 'ESTANTERIA', 'B&B', 1, 15.00),

       ('Leche entera', 'ESTANTERIA', 'Dos pinos', 1, 20.00),

       ('Leche descremada', 'ESTANTERIA',  'Dos pinos', 1 ,25.00),

       ('Leche de almendras', 'ESTANTERIA', 'Dos pinos', 1, 27.00),

       ('Leche descremeda', 'ESTANTERIA', 'Foremost', 1, 30.00),

       ('Yogurt Griego', 'ESTANTERIA', 'Olkos', 1, 50.00),

       ('Crema dulce', 'ESTANTERIA', 'Dos pinos', 1, 10.00),

       ('Leche entera', 'ESTANTERIA', 'Lala', 1, 15.00),

       ('Leche descremada', 'ESTANTERIA', 'Lala',1 ,17.00),

       ('Leche de almendra', 'ESTANTERIA', 'Lala', 1, 23.75),

       ('Mayonesa', 'ESTANTERIA','Mi patrona', 1, 12.00),

       ('Mostaza', 'ESTANTERIA', 'Mi patrona', 1, 15.00),

       ('Mantequilla sin sal', 'ESTANTERIA', 'President', 1, 15.00),

       ('Galletas cookies & cream', 'ESTANTERIA', 'Oreo', 1, 20.00),

       ('Galletas de vainilla', 'ESTANTERIA', 'Oreo', 1, 22.00),

       ('Frituras de limón', 'ESTANTERIA', 'Tortrix', 1, 20.00),

       ('Frituras de barbacoa', 'ESTANTERIA', 'Tortrix', 1, 20.00),

       ('Frituras taco chilero', 'ESTANTERIA', 'Tortrix', 1, 25.00),

       ('Galletas de chocolate', 'ESTANTERIA', 'Chocowow', 1, 15.00),

       ('Nachos de queso', 'ESTANTERIA', 'Diana', 1, 8.00),

       ('Frituras queso y jalapeño', 'ESTANTERIA', 'Doritos', 1, 15.00),

       ('Papalinas clásicas', 'ESTANTERIA', 'Lays', 1, 10.00),

       ('Chocolates', 'ESTANTERIA', 'Ferrero Rocher', 1, 75.00),

       ('Galleta relleno de fresa', 'ESTANTERIA', 'Chiky', 1, 20.00),

       ('Jalapeños', 'ESTANTERIA', 'Diana', 1, 10.00),

       ('Papalinas crema y cebolla', 'ESTANTERIA', 'Pringles', 1, 56.00),

       ('Chicle de menta', 'ESTANTERIA', 'Trident', 1, 15.00),

       ('Chocolate oscuro tableta', 'ESTANTERIA', 'Granada', 1, 6.50),

       ('Nachos naturales', 'ESTANTERIA', 'Ya está', 1, 23.75),

       ('Chocolate caramelo', 'ESTANTERIA', 'Milka', 1, 25.25),

       ('Elotitos con limón', 'ESTANTERIA','Diana', 1, 10.00),

       ('Botonetas Peanut', 'ESTANTERIA', 'M&M', 1, 25.00),

       ('Chocolate strawberry', 'ESTANTERIA', 'Milka', 1, 25.00),

       ('Maní japonés', 'ESTANTERIA', 'Diana', 1, 7.50),

       ('Botonetas wild Berry', 'ESTANTERIA', 'Skittles', 1, 10.25),

       ('Chocolate White', 'ESTANTERIA', 'Kit Kat', 1, 10.00),

       ('Yuca barbacoa', 'ESTANTERIA', 'Diana', 1, 16.25),

       ('Chocolate Dark', 'ESTANTERIA', 'Kit Kat', 1, 7.75),

       ('Milk chocolate', 'ESTANTERIA', 'Hersheys', 1, 15.00),

       ('Chocolate blanco polo nieve', 'ESTANTERIA', 'Granada', 1, 5.75),

       ('Caramelo cereza', 'ESTANTERIA', 'Halls', 1, 5.25),

       ('Galletas cremas', 'ESTANTERIA', 'Pozuelo', 1, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'ESTANTERIA','La montaña', 2, 25.00),

       ('Sal', 'ESTANTERIA', 'Suli', 2, 5.00),

       ('Margarina', 'ESTANTERIA', 'Mazola', 2, 15.00),

       ('Arroz', 'ESTANTERIA', 'Gallo Dorado', 2, 20.00),

       ('Aceite', 'ESTANTERIA', 'Weson', 2, 25.00),

       ('Salchicha', 'ESTANTERIA', 'Bremen', 2, 10.00),

       ('Helado de Vainilla', 'ESTANTERIA', 'Foremost', 2, 35.00),

       ('Cloro', 'ESTANTERIA', 'Magia blanca', 2, 15.00),

       ('Detergente', 'ESTANTERIA', 'UltraKlin', 2, 5.00),

       ('Desinfectante', 'ESTANTERIA', 'Fabuloso', 2, 12.50),

       ('Desinfectante', 'ESTANTERIA', 'AJAX', 2, 17.50),

       ('Café clásico', 'ESTANTERIA', 'NesCafé', 2, 50.00),

       ('Coca-Cola 3L', 'ESTANTERIA', 'Coca-cola', 2, 15.00),

       ('Café instantáneo', 'ESTANTERIA', 'Musun', 2, 25.00),

       ('Coca-cola lata', 'ESTANTERIA', 'Coca-cola', 2, 5.00),

       ('Chocolate en polvo', 'ESTANTERIA', 'Nesquik', 2, 15.00),

       ('Jugo coctel picante', 'ESTANTERIA', 'Marinero', 2, 5.00),

       ('Jugo de naranja con pulpa', 'ESTANTERIA', 'La Granja', 2, 15.00),

       ('Gaseosa en lata', 'ESTANTERIA', 'Salutaris', 2, 5.00),

       ('Queso crema', 'ESTANTERIA', 'Philadelphia', 2, 15.00),

       ('Huevo blanco', 'ESTANTERIA', 'GuateHuevo', 2, 10.00),

       ('Jamón de pavo', 'ESTANTERIA', 'Toledo', 2, 16.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Fud', 2, 15.00),

       ('Salchicha polaca', 'ESTANTERIA', 'Santa lucía', 2, 25.00),

       ('Salami', 'ESTANTERIA', 'Bremen', 2, 15.00),

       ('Chorizo colorado', 'ESTANTERIA', 'Santa lucía', 2, 23.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Chimex', 2, 25.00),

       ('Alas de pollo', 'ESTANTERIA', 'Pollo rey', 2, 3.00),

       ('Chuleta ahumada', 'ESTANTERIA', 'Don cristobal', 2, 25.00),

       ('Carne molida de pollo', 'ESTANTERIA', 'Pollo rey', 2, 20.00),

       ('Papel higiénico', 'ESTANTERIA', 'Suli', 2, 20.00),

       ('Pasta dental max white', 'ESTANTERIA', 'Colgate', 2, 15.00),

       ('Pasta dental triple acción', 'ESTANTERIA', 'Colgate', 2, 12.00),

       ('Papel higiénico triple hoja', 'ESTANTERIA', 'Rosal morado', 2, 100.00),

       ('Jabón líquido', 'ESTANTERIA', 'Olimpo', 2, 6.75),

       ('Barra antitraspirante', 'ESTANTERIA', 'Old spice', 2, 15.00),

       ('Enjuage bucal Plax Ice', 'ESTANTERIA', 'Colgate', 2, 35.00),

       ('Gel for men', 'ESTANTERIA', 'Ego', 2, 15.00),

       ('Jabón corporal', 'ESTANTERIA', 'Protex', 2, 33.00),

       ('mantequilla de maní', 'ESTANTERIA', 'B&B', 2, 20.00),

       ('Mermelada de mora', 'ESTANTERIA', 'B&B', 2, 15.00),

       ('Leche entera', 'ESTANTERIA', 'Dos pinos', 2, 20.00),

       ('Leche descremada', 'ESTANTERIA',  'Dos pinos', 2, 25.00),

       ('Leche de almendras', 'ESTANTERIA', 'Dos pinos', 2, 27.00),

       ('Leche descremeda', 'ESTANTERIA', 'Foremost', 2, 30.00),

       ('Yogurt Griego', 'ESTANTERIA', 'Olkos', 2, 50.00),

       ('Crema dulce', 'ESTANTERIA', 'Dos pinos', 2, 10.00),

       ('Leche entera', 'ESTANTERIA', 'Lala', 2, 15.00),

       ('Leche descremada', 'ESTANTERIA', 'Lala', 2, 17.00),

       ('Leche de almendra', 'ESTANTERIA', 'Lala', 2, 23.75),

       ('Mayonesa', 'ESTANTERIA','Mi patrona', 2, 12.00),

       ('Mostaza', 'ESTANTERIA', 'Mi patrona', 2, 15.00),

       ('Mantequilla sin sal', 'ESTANTERIA', 'President', 2, 15.00),

       ('Galletas cookies & cream', 'ESTANTERIA', 'Oreo', 2, 20.00),

       ('Galletas de vainilla', 'ESTANTERIA', 'Oreo', 2, 22.00),

       ('Frituras de limón', 'ESTANTERIA', 'Tortrix', 2, 20.00),

       ('Frituras de barbacoa', 'ESTANTERIA', 'Tortrix', 2, 20.00),

       ('Frituras taco chilero', 'ESTANTERIA', 'Tortrix', 2, 25.00),

       ('Galletas de chocolate', 'ESTANTERIA', 'Chocowow', 2, 15.00),

       ('Nachos de queso', 'ESTANTERIA', 'Diana', 2, 8.00),

       ('Frituras queso y jalapeño', 'ESTANTERIA', 'Doritos', 2, 15.00),

       ('Papalinas clásicas', 'ESTANTERIA', 'Lays', 2, 10.00),

       ('Chocolates', 'ESTANTERIA', 'Ferrero Rocher', 2, 75.00),

       ('Galleta relleno de fresa', 'ESTANTERIA', 'Chiky', 2, 20.00),

       ('Jalapeños', 'ESTANTERIA', 'Diana', 2, 10.00),

       ('Papalinas crema y cebolla', 'ESTANTERIA', 'Pringles', 2, 56.00),

       ('Chicle de menta', 'ESTANTERIA', 'Trident', 2, 15.00),

       ('Chocolate oscuro tableta', 'ESTANTERIA', 'Granada', 2, 6.50),

       ('Nachos naturales', 'ESTANTERIA', 'Ya está', 2, 23.75),

       ('Chocolate caramelo', 'ESTANTERIA', 'Milka', 2, 25.25),

       ('Elotitos con limón', 'ESTANTERIA','Diana', 2, 10.00),

       ('Botonetas Peanut', 'ESTANTERIA', 'M&M', 2, 25.00),

       ('Chocolate strawberry', 'ESTANTERIA', 'Milka', 2, 25.00),

       ('Yuca barbacoa', 'ESTANTERIA', 'Diana', 2, 16.25),

       ('Galletas cremas', 'ESTANTERIA', 'Pozuelo', 2, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'ESTANTERIA','La montaña', 3, 25.00),

       ('Sal', 'ESTANTERIA', 'Suli', 3, 5.00),

       ('Margarina', 'ESTANTERIA', 'Mazola', 3, 15.00),

       ('Arroz', 'ESTANTERIA', 'Gallo Dorado', 3, 20.00),

       ('Aceite', 'ESTANTERIA', 'Weson', 3, 25.00),

       ('Salchicha', 'ESTANTERIA', 'Bremen', 3, 10.00),

       ('Helado de Vainilla', 'ESTANTERIA', 'Foremost', 3, 35.00),

       ('Cloro', 'ESTANTERIA', 'Magia blanca', 3, 15.00),

       ('Detergente', 'ESTANTERIA', 'UltraKlin', 3, 5.00),

       ('Desinfectante', 'ESTANTERIA', 'Fabuloso', 3, 12.50),

       ('Desinfectante', 'ESTANTERIA', 'AJAX', 3, 17.50),

       ('Café clásico', 'ESTANTERIA', 'NesCafé', 3, 50.00),

       ('Coca-Cola 3L', 'ESTANTERIA', 'Coca-cola', 3, 15.00),

       ('Café instantáneo', 'ESTANTERIA', 'Musun', 3, 25.00),

       ('Coca-cola lata', 'ESTANTERIA', 'Coca-cola', 3, 5.00),

       ('Chocolate en polvo', 'ESTANTERIA', 'Nesquik', 3, 15.00),

       ('Jugo coctel picante', 'ESTANTERIA', 'Marinero', 3, 5.00),

       ('Jugo de naranja con pulpa', 'ESTANTERIA', 'La Granja', 3, 15.00),

       ('Gaseosa en lata', 'ESTANTERIA', 'Salutaris', 3, 5.00),

       ('Queso crema', 'ESTANTERIA', 'Philadelphia', 3, 15.00),

       ('Huevo blanco', 'ESTANTERIA', 'GuateHuevo', 3, 10.00),

       ('Jamón de pavo', 'ESTANTERIA', 'Toledo', 3, 16.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Fud', 3, 15.00),

       ('Salchicha polaca', 'ESTANTERIA', 'Santa lucía', 3, 25.00),

       ('Salami', 'ESTANTERIA', 'Bremen', 3, 15.00),

       ('Chorizo colorado', 'ESTANTERIA', 'Santa lucía', 3, 23.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Chimex', 3, 25.00),

       ('Alas de pollo', 'ESTANTERIA', 'Pollo rey', 3, 3.00),

       ('Chuleta ahumada', 'ESTANTERIA', 'Don cristobal', 3, 25.00),

       ('Carne molida de pollo', 'ESTANTERIA', 'Pollo rey', 3, 20.00),

       ('Papel higiénico', 'ESTANTERIA', 'Suli', 3, 20.00),

       ('Pasta dental max white', 'ESTANTERIA', 'Colgate', 3, 15.00),

       ('Pasta dental triple acción', 'ESTANTERIA', 'Colgate', 3, 12.00),

       ('Papel higiénico triple hoja', 'ESTANTERIA', 'Rosal morado', 3, 100.00),

       ('Jabón líquido', 'ESTANTERIA', 'Olimpo', 3, 6.75),

       ('Barra antitraspirante', 'ESTANTERIA', 'Old spice', 3, 15.00),

       ('Enjuage bucal Plax Ice', 'ESTANTERIA', 'Colgate', 3, 35.00),

       ('Gel for men', 'ESTANTERIA', 'Ego', 3, 15.00),

       ('Jabón corporal', 'ESTANTERIA', 'Protex', 3, 33.00),

       ('mantequilla de maní', 'ESTANTERIA', 'B&B', 3, 20.00),

       ('Mermelada de mora', 'ESTANTERIA', 'B&B', 3, 15.00),

       ('Leche entera', 'ESTANTERIA', 'Dos pinos', 3, 20.00),

       ('Leche descremada', 'ESTANTERIA',  'Dos pinos', 3, 25.00),

       ('Leche de almendras', 'ESTANTERIA', 'Dos pinos', 3, 27.00),

       ('Leche descremeda', 'ESTANTERIA', 'Foremost', 3, 30.00),

       ('Yogurt Griego', 'ESTANTERIA', 'Olkos', 3, 50.00),

       ('Crema dulce', 'ESTANTERIA', 'Dos pinos', 3, 10.00),

       ('Leche entera', 'ESTANTERIA', 'Lala', 3, 15.00),

       ('Leche descremada', 'ESTANTERIA', 'Lala', 3, 17.00),

       ('Leche de almendra', 'ESTANTERIA', 'Lala', 3, 23.75),

       ('Mayonesa', 'ESTANTERIA','Mi patrona', 3, 12.00),

       ('Mostaza', 'ESTANTERIA', 'Mi patrona', 3, 15.00),

       ('Mantequilla sin sal', 'ESTANTERIA', 'President', 3, 15.00),

       ('Galletas cookies & cream', 'ESTANTERIA', 'Oreo', 3, 20.00),

       ('Galletas de vainilla', 'ESTANTERIA', 'Oreo', 3, 22.00),

       ('Frituras de limón', 'ESTANTERIA', 'Tortrix', 3, 20.00),

       ('Frituras de barbacoa', 'ESTANTERIA', 'Tortrix', 3, 20.00),

       ('Frituras taco chilero', 'ESTANTERIA', 'Tortrix', 3, 25.00),

       ('Galletas de chocolate', 'ESTANTERIA', 'Chocowow', 3, 15.00),

       ('Nachos de queso', 'ESTANTERIA', 'Diana', 3, 8.00),

       ('Frituras queso y jalapeño', 'ESTANTERIA', 'Doritos', 3, 15.00),

       ('Papalinas clásicas', 'ESTANTERIA', 'Lays', 3, 10.00),

       ('Chocolates', 'ESTANTERIA', 'Ferrero Rocher', 3, 75.00),

       ('Galleta relleno de fresa', 'ESTANTERIA', 'Chiky', 3, 20.00),

       ('Jalapeños', 'ESTANTERIA', 'Diana', 3, 10.00),

       ('Papalinas crema y cebolla', 'ESTANTERIA', 'Pringles', 3, 56.00),

       ('Chicle de menta', 'ESTANTERIA', 'Trident', 3, 15.00),

       ('Chocolate oscuro tableta', 'ESTANTERIA', 'Granada', 3, 6.50),

       ('Nachos naturales', 'ESTANTERIA', 'Ya está', 3, 23.75),

       ('Chocolate caramelo', 'ESTANTERIA', 'Milka', 3, 25.25),

       ('Elotitos con limón', 'ESTANTERIA','Diana', 3, 10.00),

       ('Botonetas Peanut', 'ESTANTERIA', 'M&M', 3, 25.00),

       ('Chocolate strawberry', 'ESTANTERIA', 'Milka', 3, 25.00),

       ('Yuca barbacoa', 'ESTANTERIA', 'Diana', 3, 16.25),

       ('Galletas cremas', 'ESTANTERIA', 'Pozuelo', 3, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'ESTANTERIA','La montaña', 1, 25.00),

       ('Sal', 'ESTANTERIA', 'Suli', 1, 5.00),

       ('Margarina', 'ESTANTERIA', 'Mazola', 1, 15.00),

       ('Arroz', 'ESTANTERIA', 'Gallo Dorado', 1, 20.00),

       ('Aceite', 'ESTANTERIA', 'Weson', 1, 25.00),

       ('Salchicha', 'ESTANTERIA', 'Bremen', 1, 10.00),

       ('Helado de Vainilla', 'ESTANTERIA', 'Foremost', 1, 35.00),

       ('Cloro', 'ESTANTERIA', 'Magia blanca', 1, 15.00),

       ('Detergente', 'ESTANTERIA', 'UltraKlin', 1, 5.00),

       ('Desinfectante', 'ESTANTERIA', 'Fabuloso', 1, 12.50),

       ('Desinfectante', 'ESTANTERIA', 'AJAX', 1, 17.50),

       ('Café clásico', 'ESTANTERIA', 'NesCafé', 1, 50.00),

       ('Coca-Cola 3L', 'ESTANTERIA', 'Coca-cola', 1, 15.00),

       ('Café instantáneo', 'ESTANTERIA', 'Musun', 1, 25.00),

       ('Coca-cola lata', 'ESTANTERIA', 'Coca-cola', 1, 5.00),

       ('Chocolate en polvo', 'ESTANTERIA', 'Nesquik', 1, 15.00),

       ('Jugo coctel picante', 'ESTANTERIA', 'Marinero', 1, 5.00),

       ('Jugo de naranja con pulpa', 'ESTANTERIA', 'La Granja', 1, 15.00),

       ('Gaseosa en lata', 'ESTANTERIA', 'Salutaris', 1, 5.00),

       ('Queso crema', 'ESTANTERIA', 'Philadelphia', 1, 15.00),

       ('Huevo blanco', 'ESTANTERIA', 'GuateHuevo', 1, 10.00),

       ('Jamón de pavo', 'ESTANTERIA', 'Toledo', 1, 16.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Fud', 1, 15.00),

       ('Salchicha polaca', 'ESTANTERIA', 'Santa lucía', 1, 25.00),

       ('Salami', 'ESTANTERIA', 'Bremen', 1, 15.00),

       ('Chorizo colorado', 'ESTANTERIA', 'Santa lucía', 1, 23.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Chimex', 1, 25.00),

       ('Alas de pollo', 'ESTANTERIA', 'Pollo rey', 1, 3.00),

       ('Tortita de pollo', 'ESTANTERIA', 'Pollo rey', 1, 2.00),

       ('Pechuga de pollo', 'ESTANTERIA', 'Pollo pio', 1, 35.00),

       ('Pollo ahumado', 'ESTANTERIA', 'Pio lindo', 1, 25.00),

       ('Torta de res', 'ESTANTERIA', 'Corte sano', 1, 25.00),

       ('Chuleta ahumada', 'ESTANTERIA', 'Don cristobal', 1, 25.00),

       ('Carne molida de pollo', 'ESTANTERIA', 'Pollo rey', 1, 20.00),

       ('Papel higiénico', 'ESTANTERIA', 'Suli', 1, 20.00),

       ('Pasta dental max white', 'ESTANTERIA', 'Colgate', 1, 15.00),

       ('Pasta dental triple acción', 'ESTANTERIA', 'Colgate', 1, 12.00),

       ('Papel higiénico triple hoja', 'ESTANTERIA', 'Rosal morado', 1, 100.00),

       ('Jabón líquido', 'ESTANTERIA', 'Olimpo', 1, 6.75),

       ('Barra antitraspirante', 'ESTANTERIA', 'Old spice', 1, 15.00),

       ('Enjuage bucal Plax Ice', 'ESTANTERIA', 'Colgate', 1, 35.00),

       ('Gel for men', 'ESTANTERIA', 'Ego', 1, 15.00),

       ('Jabón corporal', 'ESTANTERIA', 'Protex',1 ,33.00),

       ('Licuadora', 'ESTANTERIA', 'DuraBrand', 1, 180.00),

       ('microondas', 'ESTANTERIA', 'Acros', 1, 700.00),

       ('Plancha cerámica', 'ESTANTERIA', 'Decker', 1, 200.00),

       ('Batidora de mano', 'ESTANTERIA', 'DuraBrand', 1, 100.00),

       ('Ketchup', 'ESTANTERIA', 'Essential', 1, 25.00),

       ('Medallones', 'ESTANTERIA','Pollo rey', 1, 25.00),

       ('Mezcla para panqueques', 'ESTANTERIA', 'Golden', 1, 15.00),

       ('Enjuague bucal', 'ESTANTERIA', 'LISTERINE', 1, 25.00),

       ('Toalla femenina', 'ESTANTERIA', 'kotex', 1, 12.40),

       ('Toalla femenina', 'ESTANTERIA', 'Saba', 1, 15.00),

       ('Crema corporal', 'ESTANTERIA', 'Nivea', 1, 50.00),

       ('Desodorante hombre', 'ESTANTERIA', 'Nivea men', 1, 25.00),

       ('Pasta dental', 'ESTANTERIA', 'Oral-B', 1, 35.00),

       ('Shampoo', 'ESTANTERIA', 'ElVive', 1, 45.60),

       ('mantequilla de maní', 'ESTANTERIA', 'B&B', 1, 20.00),

       ('Mermelada de mora', 'ESTANTERIA', 'B&B', 1, 15.00),

       ('Leche entera', 'ESTANTERIA', 'Dos pinos', 1, 20.00),

       ('Leche descremada', 'ESTANTERIA',  'Dos pinos', 1 ,25.00),

       ('Leche de almendras', 'ESTANTERIA', 'Dos pinos', 1, 27.00),

       ('Leche descremeda', 'ESTANTERIA', 'Foremost', 1, 30.00),

       ('Yogurt Griego', 'ESTANTERIA', 'Olkos', 1, 50.00),

       ('Crema dulce', 'ESTANTERIA', 'Dos pinos', 1, 10.00),

       ('Leche entera', 'ESTANTERIA', 'Lala', 1, 15.00),

       ('Leche descremada', 'ESTANTERIA', 'Lala',1 ,17.00),

       ('Leche de almendra', 'ESTANTERIA', 'Lala', 1, 23.75),

       ('Mayonesa', 'ESTANTERIA','Mi patrona', 1, 12.00),

       ('Mostaza', 'ESTANTERIA', 'Mi patrona', 1, 15.00),

       ('Mantequilla sin sal', 'ESTANTERIA', 'President', 1, 15.00),

       ('Galletas cookies & cream', 'ESTANTERIA', 'Oreo', 1, 20.00),

       ('Galletas de vainilla', 'ESTANTERIA', 'Oreo', 1, 22.00),

       ('Frituras de limón', 'ESTANTERIA', 'Tortrix', 1, 20.00),

       ('Frituras de barbacoa', 'ESTANTERIA', 'Tortrix', 1, 20.00),

       ('Frituras taco chilero', 'ESTANTERIA', 'Tortrix', 1, 25.00),

       ('Galletas de chocolate', 'ESTANTERIA', 'Chocowow', 1, 15.00),

       ('Nachos de queso', 'ESTANTERIA', 'Diana', 1, 8.00),

       ('Frituras queso y jalapeño', 'ESTANTERIA', 'Doritos', 1, 15.00),

       ('Papalinas clásicas', 'ESTANTERIA', 'Lays', 1, 10.00),

       ('Chocolates', 'ESTANTERIA', 'Ferrero Rocher', 1, 75.00),

       ('Galleta relleno de fresa', 'ESTANTERIA', 'Chiky', 1, 20.00),

       ('Jalapeños', 'ESTANTERIA', 'Diana', 1, 10.00),

       ('Papalinas crema y cebolla', 'ESTANTERIA', 'Pringles', 1, 56.00),

       ('Chicle de menta', 'ESTANTERIA', 'Trident', 1, 15.00),

       ('Chocolate oscuro tableta', 'ESTANTERIA', 'Granada', 1, 6.50),

       ('Nachos naturales', 'ESTANTERIA', 'Ya está', 1, 23.75),

       ('Chocolate caramelo', 'ESTANTERIA', 'Milka', 1, 25.25),

       ('Elotitos con limón', 'ESTANTERIA','Diana', 1, 10.00),

       ('Botonetas Peanut', 'ESTANTERIA', 'M&M', 1, 25.00),

       ('Chocolate strawberry', 'ESTANTERIA', 'Milka', 1, 25.00),

       ('Maní japonés', 'ESTANTERIA', 'Diana', 1, 7.50),

       ('Botonetas wild Berry', 'ESTANTERIA', 'Skittles', 1, 10.25),

       ('Chocolate White', 'ESTANTERIA', 'Kit Kat', 1, 10.00),

       ('Yuca barbacoa', 'ESTANTERIA', 'Diana', 1, 16.25),

       ('Chocolate Dark', 'ESTANTERIA', 'Kit Kat', 1, 7.75),

       ('Milk chocolate', 'ESTANTERIA', 'Hersheys', 1, 15.00),

       ('Chocolate blanco polo nieve', 'ESTANTERIA', 'Granada', 1, 5.75),

       ('Caramelo cereza', 'ESTANTERIA', 'Halls', 1, 5.25),

       ('Galletas cremas', 'ESTANTERIA', 'Pozuelo', 1, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'ESTANTERIA','La montaña', 2, 25.00),

       ('Sal', 'ESTANTERIA', 'Suli', 2, 5.00),

       ('Margarina', 'ESTANTERIA', 'Mazola', 2, 15.00),

       ('Arroz', 'ESTANTERIA', 'Gallo Dorado', 2, 20.00),

       ('Aceite', 'ESTANTERIA', 'Weson', 2, 25.00),

       ('Salchicha', 'ESTANTERIA', 'Bremen', 2, 10.00),

       ('Helado de Vainilla', 'ESTANTERIA', 'Foremost', 2, 35.00),

       ('Cloro', 'ESTANTERIA', 'Magia blanca', 2, 15.00),

       ('Detergente', 'ESTANTERIA', 'UltraKlin', 2, 5.00),

       ('Desinfectante', 'ESTANTERIA', 'Fabuloso', 2, 12.50),

       ('Desinfectante', 'ESTANTERIA', 'AJAX', 2, 17.50),

       ('Café clásico', 'ESTANTERIA', 'NesCafé', 2, 50.00),

       ('Coca-Cola 3L', 'ESTANTERIA', 'Coca-cola', 2, 15.00),

       ('Café instantáneo', 'ESTANTERIA', 'Musun', 2, 25.00),

       ('Coca-cola lata', 'ESTANTERIA', 'Coca-cola', 2, 5.00),

       ('Chocolate en polvo', 'ESTANTERIA', 'Nesquik', 2, 15.00),

       ('Jugo coctel picante', 'ESTANTERIA', 'Marinero', 2, 5.00),

       ('Jugo de naranja con pulpa', 'ESTANTERIA', 'La Granja', 2, 15.00),

       ('Gaseosa en lata', 'ESTANTERIA', 'Salutaris', 2, 5.00),

       ('Queso crema', 'ESTANTERIA', 'Philadelphia', 2, 15.00),

       ('Huevo blanco', 'ESTANTERIA', 'GuateHuevo', 2, 10.00),

       ('Jamón de pavo', 'ESTANTERIA', 'Toledo', 2, 16.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Fud', 2, 15.00),

       ('Salchicha polaca', 'ESTANTERIA', 'Santa lucía', 2, 25.00),

       ('Salami', 'ESTANTERIA', 'Bremen', 2, 15.00),

       ('Chorizo colorado', 'ESTANTERIA', 'Santa lucía', 2, 23.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Chimex', 2, 25.00),

       ('Alas de pollo', 'ESTANTERIA', 'Pollo rey', 2, 3.00),

       ('Chuleta ahumada', 'ESTANTERIA', 'Don cristobal', 2, 25.00),

       ('Carne molida de pollo', 'ESTANTERIA', 'Pollo rey', 2, 20.00),

       ('Papel higiénico', 'ESTANTERIA', 'Suli', 2, 20.00),

       ('Pasta dental max white', 'ESTANTERIA', 'Colgate', 2, 15.00),

       ('Pasta dental triple acción', 'ESTANTERIA', 'Colgate', 2, 12.00),

       ('Papel higiénico triple hoja', 'ESTANTERIA', 'Rosal morado', 2, 100.00),

       ('Jabón líquido', 'ESTANTERIA', 'Olimpo', 2, 6.75),

       ('Barra antitraspirante', 'ESTANTERIA', 'Old spice', 2, 15.00),

       ('Enjuage bucal Plax Ice', 'ESTANTERIA', 'Colgate', 2, 35.00),

       ('Gel for men', 'ESTANTERIA', 'Ego', 2, 15.00),

       ('Jabón corporal', 'ESTANTERIA', 'Protex', 2, 33.00),

       ('mantequilla de maní', 'ESTANTERIA', 'B&B', 2, 20.00),

       ('Mermelada de mora', 'ESTANTERIA', 'B&B', 2, 15.00),

       ('Leche entera', 'ESTANTERIA', 'Dos pinos', 2, 20.00),

       ('Leche descremada', 'ESTANTERIA',  'Dos pinos', 2, 25.00),

       ('Leche de almendras', 'ESTANTERIA', 'Dos pinos', 2, 27.00),

       ('Leche descremeda', 'ESTANTERIA', 'Foremost', 2, 30.00),

       ('Yogurt Griego', 'ESTANTERIA', 'Olkos', 2, 50.00),

       ('Crema dulce', 'ESTANTERIA', 'Dos pinos', 2, 10.00),

       ('Leche entera', 'ESTANTERIA', 'Lala', 2, 15.00),

       ('Leche descremada', 'ESTANTERIA', 'Lala', 2, 17.00),

       ('Leche de almendra', 'ESTANTERIA', 'Lala', 2, 23.75),

       ('Mayonesa', 'ESTANTERIA','Mi patrona', 2, 12.00),

       ('Mostaza', 'ESTANTERIA', 'Mi patrona', 2, 15.00),

       ('Mantequilla sin sal', 'ESTANTERIA', 'President', 2, 15.00),

       ('Galletas cookies & cream', 'ESTANTERIA', 'Oreo', 2, 20.00),

       ('Galletas de vainilla', 'ESTANTERIA', 'Oreo', 2, 22.00),

       ('Frituras de limón', 'ESTANTERIA', 'Tortrix', 2, 20.00),

       ('Frituras de barbacoa', 'ESTANTERIA', 'Tortrix', 2, 20.00),

       ('Frituras taco chilero', 'ESTANTERIA', 'Tortrix', 2, 25.00),

       ('Galletas de chocolate', 'ESTANTERIA', 'Chocowow', 2, 15.00),

       ('Nachos de queso', 'ESTANTERIA', 'Diana', 2, 8.00),

       ('Frituras queso y jalapeño', 'ESTANTERIA', 'Doritos', 2, 15.00),

       ('Papalinas clásicas', 'ESTANTERIA', 'Lays', 2, 10.00),

       ('Chocolates', 'ESTANTERIA', 'Ferrero Rocher', 2, 75.00),

       ('Galleta relleno de fresa', 'ESTANTERIA', 'Chiky', 2, 20.00),

       ('Jalapeños', 'ESTANTERIA', 'Diana', 2, 10.00),

       ('Papalinas crema y cebolla', 'ESTANTERIA', 'Pringles', 2, 56.00),

       ('Chicle de menta', 'ESTANTERIA', 'Trident', 2, 15.00),

       ('Chocolate oscuro tableta', 'ESTANTERIA', 'Granada', 2, 6.50),

       ('Nachos naturales', 'ESTANTERIA', 'Ya está', 2, 23.75),

       ('Chocolate caramelo', 'ESTANTERIA', 'Milka', 2, 25.25),

       ('Elotitos con limón', 'ESTANTERIA','Diana', 2, 10.00),

       ('Botonetas Peanut', 'ESTANTERIA', 'M&M', 2, 25.00),

       ('Chocolate strawberry', 'ESTANTERIA', 'Milka', 2, 25.00),

       ('Yuca barbacoa', 'ESTANTERIA', 'Diana', 2, 16.25),

       ('Galletas cremas', 'ESTANTERIA', 'Pozuelo', 2, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'ESTANTERIA','La montaña', 3, 25.00),

       ('Sal', 'ESTANTERIA', 'Suli', 3, 5.00),

       ('Margarina', 'ESTANTERIA', 'Mazola', 3, 15.00),

       ('Arroz', 'ESTANTERIA', 'Gallo Dorado', 3, 20.00),

       ('Aceite', 'ESTANTERIA', 'Weson', 3, 25.00),

       ('Salchicha', 'ESTANTERIA', 'Bremen', 3, 10.00),

       ('Helado de Vainilla', 'ESTANTERIA', 'Foremost', 3, 35.00),

       ('Cloro', 'ESTANTERIA', 'Magia blanca', 3, 15.00),

       ('Detergente', 'ESTANTERIA', 'UltraKlin', 3, 5.00),

       ('Desinfectante', 'ESTANTERIA', 'Fabuloso', 3, 12.50),

       ('Desinfectante', 'ESTANTERIA', 'AJAX', 3, 17.50),

       ('Café clásico', 'ESTANTERIA', 'NesCafé', 3, 50.00),

       ('Coca-Cola 3L', 'ESTANTERIA', 'Coca-cola', 3, 15.00),

       ('Café instantáneo', 'ESTANTERIA', 'Musun', 3, 25.00),

       ('Coca-cola lata', 'ESTANTERIA', 'Coca-cola', 3, 5.00),

       ('Chocolate en polvo', 'ESTANTERIA', 'Nesquik', 3, 15.00),

       ('Jugo coctel picante', 'ESTANTERIA', 'Marinero', 3, 5.00),

       ('Jugo de naranja con pulpa', 'ESTANTERIA', 'La Granja', 3, 15.00),

       ('Gaseosa en lata', 'ESTANTERIA', 'Salutaris', 3, 5.00),

       ('Queso crema', 'ESTANTERIA', 'Philadelphia', 3, 15.00),

       ('Huevo blanco', 'ESTANTERIA', 'GuateHuevo', 3, 10.00),

       ('Jamón de pavo', 'ESTANTERIA', 'Toledo', 3, 16.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Fud', 3, 15.00),

       ('Salchicha polaca', 'ESTANTERIA', 'Santa lucía', 3, 25.00),

       ('Salami', 'ESTANTERIA', 'Bremen', 3, 15.00),

       ('Chorizo colorado', 'ESTANTERIA', 'Santa lucía', 3, 23.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Chimex', 3, 25.00),

       ('Alas de pollo', 'ESTANTERIA', 'Pollo rey', 3, 3.00),

       ('Chuleta ahumada', 'ESTANTERIA', 'Don cristobal', 3, 25.00),

       ('Carne molida de pollo', 'ESTANTERIA', 'Pollo rey', 3, 20.00),

       ('Papel higiénico', 'ESTANTERIA', 'Suli', 3, 20.00),

       ('Pasta dental max white', 'ESTANTERIA', 'Colgate', 3, 15.00),

       ('Pasta dental triple acción', 'ESTANTERIA', 'Colgate', 3, 12.00),

       ('Papel higiénico triple hoja', 'ESTANTERIA', 'Rosal morado', 3, 100.00),

       ('Jabón líquido', 'ESTANTERIA', 'Olimpo', 3, 6.75),

       ('Barra antitraspirante', 'ESTANTERIA', 'Old spice', 3, 15.00),

       ('Enjuage bucal Plax Ice', 'ESTANTERIA', 'Colgate', 3, 35.00),

       ('Gel for men', 'ESTANTERIA', 'Ego', 3, 15.00),

       ('Jabón corporal', 'ESTANTERIA', 'Protex', 3, 33.00),

       ('mantequilla de maní', 'ESTANTERIA', 'B&B', 3, 20.00),

       ('Mermelada de mora', 'ESTANTERIA', 'B&B', 3, 15.00),

       ('Leche entera', 'ESTANTERIA', 'Dos pinos', 3, 20.00),

       ('Leche descremada', 'ESTANTERIA',  'Dos pinos', 3, 25.00),

       ('Leche de almendras', 'ESTANTERIA', 'Dos pinos', 3, 27.00),

       ('Leche descremeda', 'ESTANTERIA', 'Foremost', 3, 30.00),

       ('Yogurt Griego', 'ESTANTERIA', 'Olkos', 3, 50.00),

       ('Crema dulce', 'ESTANTERIA', 'Dos pinos', 3, 10.00),

       ('Leche entera', 'ESTANTERIA', 'Lala', 3, 15.00),

       ('Leche descremada', 'ESTANTERIA', 'Lala', 3, 17.00),

       ('Leche de almendra', 'ESTANTERIA', 'Lala', 3, 23.75),

       ('Mayonesa', 'ESTANTERIA','Mi patrona', 3, 12.00),

       ('Mostaza', 'ESTANTERIA', 'Mi patrona', 3, 15.00),

       ('Mantequilla sin sal', 'ESTANTERIA', 'President', 3, 15.00),

       ('Galletas cookies & cream', 'ESTANTERIA', 'Oreo', 3, 20.00),

       ('Galletas de vainilla', 'ESTANTERIA', 'Oreo', 3, 22.00),

       ('Frituras de limón', 'ESTANTERIA', 'Tortrix', 3, 20.00),

       ('Frituras de barbacoa', 'ESTANTERIA', 'Tortrix', 3, 20.00),

       ('Frituras taco chilero', 'ESTANTERIA', 'Tortrix', 3, 25.00),

       ('Galletas de chocolate', 'ESTANTERIA', 'Chocowow', 3, 15.00),

       ('Nachos de queso', 'ESTANTERIA', 'Diana', 3, 8.00),

       ('Frituras queso y jalapeño', 'ESTANTERIA', 'Doritos', 3, 15.00),

       ('Papalinas clásicas', 'ESTANTERIA', 'Lays', 3, 10.00),

       ('Chocolates', 'ESTANTERIA', 'Ferrero Rocher', 3, 75.00),

       ('Galleta relleno de fresa', 'ESTANTERIA', 'Chiky', 3, 20.00),

       ('Jalapeños', 'ESTANTERIA', 'Diana', 3, 10.00),

       ('Papalinas crema y cebolla', 'ESTANTERIA', 'Pringles', 3, 56.00),

       ('Chicle de menta', 'ESTANTERIA', 'Trident', 3, 15.00),

       ('Chocolate oscuro tableta', 'ESTANTERIA', 'Granada', 3, 6.50),

       ('Nachos naturales', 'ESTANTERIA', 'Ya está', 3, 23.75),

       ('Chocolate caramelo', 'ESTANTERIA', 'Milka', 3, 25.25),

       ('Elotitos con limón', 'ESTANTERIA','Diana', 3, 10.00),

       ('Botonetas Peanut', 'ESTANTERIA', 'M&M', 3, 25.00),

       ('Chocolate strawberry', 'ESTANTERIA', 'Milka', 3, 25.00),

       ('Yuca barbacoa', 'ESTANTERIA', 'Diana', 3, 16.25),

       ('Galletas cremas', 'ESTANTERIA', 'Pozuelo', 3, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'ESTANTERIA','La montaña', 1, 25.00),

       ('Sal', 'ESTANTERIA', 'Suli', 1, 5.00),

       ('Margarina', 'ESTANTERIA', 'Mazola', 1, 15.00),

       ('Arroz', 'ESTANTERIA', 'Gallo Dorado', 1, 20.00),

       ('Aceite', 'ESTANTERIA', 'Weson', 1, 25.00),

       ('Salchicha', 'ESTANTERIA', 'Bremen', 1, 10.00),

       ('Helado de Vainilla', 'ESTANTERIA', 'Foremost', 1, 35.00),

       ('Cloro', 'ESTANTERIA', 'Magia blanca', 1, 15.00),

       ('Detergente', 'ESTANTERIA', 'UltraKlin', 1, 5.00),

       ('Desinfectante', 'ESTANTERIA', 'Fabuloso', 1, 12.50),

       ('Desinfectante', 'ESTANTERIA', 'AJAX', 1, 17.50),

       ('Café clásico', 'ESTANTERIA', 'NesCafé', 1, 50.00),

       ('Coca-Cola 3L', 'ESTANTERIA', 'Coca-cola', 1, 15.00),

       ('Café instantáneo', 'ESTANTERIA', 'Musun', 1, 25.00),

       ('Coca-cola lata', 'ESTANTERIA', 'Coca-cola', 1, 5.00),

       ('Chocolate en polvo', 'ESTANTERIA', 'Nesquik', 1, 15.00),

       ('Jugo coctel picante', 'ESTANTERIA', 'Marinero', 1, 5.00),

       ('Jugo de naranja con pulpa', 'ESTANTERIA', 'La Granja', 1, 15.00),

       ('Gaseosa en lata', 'ESTANTERIA', 'Salutaris', 1, 5.00),

       ('Queso crema', 'ESTANTERIA', 'Philadelphia', 1, 15.00),

       ('Huevo blanco', 'ESTANTERIA', 'GuateHuevo', 1, 10.00),

       ('Jamón de pavo', 'ESTANTERIA', 'Toledo', 1, 16.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Fud', 1, 15.00),

       ('Salchicha polaca', 'ESTANTERIA', 'Santa lucía', 1, 25.00),

       ('Salami', 'ESTANTERIA', 'Bremen', 1, 15.00),

       ('Chorizo colorado', 'ESTANTERIA', 'Santa lucía', 1, 23.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Chimex', 1, 25.00),

       ('Alas de pollo', 'ESTANTERIA', 'Pollo rey', 1, 3.00),

       ('Tortita de pollo', 'ESTANTERIA', 'Pollo rey', 1, 2.00),

       ('Pechuga de pollo', 'ESTANTERIA', 'Pollo pio', 1, 35.00),

       ('Pollo ahumado', 'ESTANTERIA', 'Pio lindo', 1, 25.00),

       ('Torta de res', 'ESTANTERIA', 'Corte sano', 1, 25.00),

       ('Chuleta ahumada', 'ESTANTERIA', 'Don cristobal', 1, 25.00),

       ('Carne molida de pollo', 'ESTANTERIA', 'Pollo rey', 1, 20.00),

       ('Papel higiénico', 'ESTANTERIA', 'Suli', 1, 20.00),

       ('Pasta dental max white', 'ESTANTERIA', 'Colgate', 1, 15.00),

       ('Pasta dental triple acción', 'ESTANTERIA', 'Colgate', 1, 12.00),

       ('Papel higiénico triple hoja', 'ESTANTERIA', 'Rosal morado', 1, 100.00),

       ('Jabón líquido', 'ESTANTERIA', 'Olimpo', 1, 6.75),

       ('Barra antitraspirante', 'ESTANTERIA', 'Old spice', 1, 15.00),

       ('Enjuage bucal Plax Ice', 'ESTANTERIA', 'Colgate', 1, 35.00),

       ('Gel for men', 'ESTANTERIA', 'Ego', 1, 15.00),

       ('Jabón corporal', 'ESTANTERIA', 'Protex',1 ,33.00),

       ('Licuadora', 'ESTANTERIA', 'DuraBrand', 1, 180.00),

       ('microondas', 'ESTANTERIA', 'Acros', 1, 700.00),

       ('Plancha cerámica', 'ESTANTERIA', 'Decker', 1, 200.00),

       ('Batidora de mano', 'ESTANTERIA', 'DuraBrand', 1, 100.00),

       ('Ketchup', 'ESTANTERIA', 'Essential', 1, 25.00),

       ('Medallones', 'ESTANTERIA','Pollo rey', 1, 25.00),

       ('Mezcla para panqueques', 'ESTANTERIA', 'Golden', 1, 15.00),

       ('Enjuague bucal', 'ESTANTERIA', 'LISTERINE', 1, 25.00),

       ('Toalla femenina', 'ESTANTERIA', 'kotex', 1, 12.40),

       ('Toalla femenina', 'ESTANTERIA', 'Saba', 1, 15.00),

       ('Crema corporal', 'ESTANTERIA', 'Nivea', 1, 50.00),

       ('Desodorante hombre', 'ESTANTERIA', 'Nivea men', 1, 25.00),

       ('Pasta dental', 'ESTANTERIA', 'Oral-B', 1, 35.00),

       ('Shampoo', 'ESTANTERIA', 'ElVive', 1, 45.60),

       ('mantequilla de maní', 'ESTANTERIA', 'B&B', 1, 20.00),

       ('Mermelada de mora', 'ESTANTERIA', 'B&B', 1, 15.00),

       ('Leche entera', 'ESTANTERIA', 'Dos pinos', 1, 20.00),

       ('Leche descremada', 'ESTANTERIA',  'Dos pinos', 1 ,25.00),

       ('Leche de almendras', 'ESTANTERIA', 'Dos pinos', 1, 27.00),

       ('Leche descremeda', 'ESTANTERIA', 'Foremost', 1, 30.00),

       ('Yogurt Griego', 'ESTANTERIA', 'Olkos', 1, 50.00),

       ('Crema dulce', 'ESTANTERIA', 'Dos pinos', 1, 10.00),

       ('Leche entera', 'ESTANTERIA', 'Lala', 1, 15.00),

       ('Leche descremada', 'ESTANTERIA', 'Lala',1 ,17.00),

       ('Leche de almendra', 'ESTANTERIA', 'Lala', 1, 23.75),

       ('Mayonesa', 'ESTANTERIA','Mi patrona', 1, 12.00),

       ('Mostaza', 'ESTANTERIA', 'Mi patrona', 1, 15.00),

       ('Mantequilla sin sal', 'ESTANTERIA', 'President', 1, 15.00),

       ('Galletas cookies & cream', 'ESTANTERIA', 'Oreo', 1, 20.00),

       ('Galletas de vainilla', 'ESTANTERIA', 'Oreo', 1, 22.00),

       ('Frituras de limón', 'ESTANTERIA', 'Tortrix', 1, 20.00),

       ('Frituras de barbacoa', 'ESTANTERIA', 'Tortrix', 1, 20.00),

       ('Frituras taco chilero', 'ESTANTERIA', 'Tortrix', 1, 25.00),

       ('Galletas de chocolate', 'ESTANTERIA', 'Chocowow', 1, 15.00),

       ('Nachos de queso', 'ESTANTERIA', 'Diana', 1, 8.00),

       ('Frituras queso y jalapeño', 'ESTANTERIA', 'Doritos', 1, 15.00),

       ('Papalinas clásicas', 'ESTANTERIA', 'Lays', 1, 10.00),

       ('Chocolates', 'ESTANTERIA', 'Ferrero Rocher', 1, 75.00),

       ('Galleta relleno de fresa', 'ESTANTERIA', 'Chiky', 1, 20.00),

       ('Jalapeños', 'ESTANTERIA', 'Diana', 1, 10.00),

       ('Papalinas crema y cebolla', 'ESTANTERIA', 'Pringles', 1, 56.00),

       ('Chicle de menta', 'ESTANTERIA', 'Trident', 1, 15.00),

       ('Chocolate oscuro tableta', 'ESTANTERIA', 'Granada', 1, 6.50),

       ('Nachos naturales', 'ESTANTERIA', 'Ya está', 1, 23.75),

       ('Chocolate caramelo', 'ESTANTERIA', 'Milka', 1, 25.25),

       ('Elotitos con limón', 'ESTANTERIA','Diana', 1, 10.00),

       ('Botonetas Peanut', 'ESTANTERIA', 'M&M', 1, 25.00),

       ('Chocolate strawberry', 'ESTANTERIA', 'Milka', 1, 25.00),

       ('Maní japonés', 'ESTANTERIA', 'Diana', 1, 7.50),

       ('Botonetas wild Berry', 'ESTANTERIA', 'Skittles', 1, 10.25),

       ('Chocolate White', 'ESTANTERIA', 'Kit Kat', 1, 10.00),

       ('Yuca barbacoa', 'ESTANTERIA', 'Diana', 1, 16.25),

       ('Chocolate Dark', 'ESTANTERIA', 'Kit Kat', 1, 7.75),

       ('Milk chocolate', 'ESTANTERIA', 'Hersheys', 1, 15.00),

       ('Chocolate blanco polo nieve', 'ESTANTERIA', 'Granada', 1, 5.75),

       ('Caramelo cereza', 'ESTANTERIA', 'Halls', 1, 5.25),

       ('Galletas cremas', 'ESTANTERIA', 'Pozuelo', 1, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'ESTANTERIA','La montaña', 2, 25.00),

       ('Sal', 'ESTANTERIA', 'Suli', 2, 5.00),

       ('Margarina', 'ESTANTERIA', 'Mazola', 2, 15.00),

       ('Arroz', 'ESTANTERIA', 'Gallo Dorado', 2, 20.00),

       ('Aceite', 'ESTANTERIA', 'Weson', 2, 25.00),

       ('Salchicha', 'ESTANTERIA', 'Bremen', 2, 10.00),

       ('Helado de Vainilla', 'ESTANTERIA', 'Foremost', 2, 35.00),

       ('Cloro', 'ESTANTERIA', 'Magia blanca', 2, 15.00),

       ('Detergente', 'ESTANTERIA', 'UltraKlin', 2, 5.00),

       ('Desinfectante', 'ESTANTERIA', 'Fabuloso', 2, 12.50),

       ('Desinfectante', 'ESTANTERIA', 'AJAX', 2, 17.50),

       ('Café clásico', 'ESTANTERIA', 'NesCafé', 2, 50.00),

       ('Coca-Cola 3L', 'ESTANTERIA', 'Coca-cola', 2, 15.00),

       ('Café instantáneo', 'ESTANTERIA', 'Musun', 2, 25.00),

       ('Coca-cola lata', 'ESTANTERIA', 'Coca-cola', 2, 5.00),

       ('Chocolate en polvo', 'ESTANTERIA', 'Nesquik', 2, 15.00),

       ('Jugo coctel picante', 'ESTANTERIA', 'Marinero', 2, 5.00),

       ('Jugo de naranja con pulpa', 'ESTANTERIA', 'La Granja', 2, 15.00),

       ('Gaseosa en lata', 'ESTANTERIA', 'Salutaris', 2, 5.00),

       ('Queso crema', 'ESTANTERIA', 'Philadelphia', 2, 15.00),

       ('Huevo blanco', 'ESTANTERIA', 'GuateHuevo', 2, 10.00),

       ('Jamón de pavo', 'ESTANTERIA', 'Toledo', 2, 16.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Fud', 2, 15.00),

       ('Salchicha polaca', 'ESTANTERIA', 'Santa lucía', 2, 25.00),

       ('Salami', 'ESTANTERIA', 'Bremen', 2, 15.00),

       ('Chorizo colorado', 'ESTANTERIA', 'Santa lucía', 2, 23.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Chimex', 2, 25.00),

       ('Alas de pollo', 'ESTANTERIA', 'Pollo rey', 2, 3.00),

       ('Chuleta ahumada', 'ESTANTERIA', 'Don cristobal', 2, 25.00),

       ('Carne molida de pollo', 'ESTANTERIA', 'Pollo rey', 2, 20.00),

       ('Papel higiénico', 'ESTANTERIA', 'Suli', 2, 20.00),

       ('Pasta dental max white', 'ESTANTERIA', 'Colgate', 2, 15.00),

       ('Pasta dental triple acción', 'ESTANTERIA', 'Colgate', 2, 12.00),

       ('Papel higiénico triple hoja', 'ESTANTERIA', 'Rosal morado', 2, 100.00),

       ('Jabón líquido', 'ESTANTERIA', 'Olimpo', 2, 6.75),

       ('Barra antitraspirante', 'ESTANTERIA', 'Old spice', 2, 15.00),

       ('Enjuage bucal Plax Ice', 'ESTANTERIA', 'Colgate', 2, 35.00),

       ('Gel for men', 'ESTANTERIA', 'Ego', 2, 15.00),

       ('Jabón corporal', 'ESTANTERIA', 'Protex', 2, 33.00),

       ('mantequilla de maní', 'ESTANTERIA', 'B&B', 2, 20.00),

       ('Mermelada de mora', 'ESTANTERIA', 'B&B', 2, 15.00),

       ('Leche entera', 'ESTANTERIA', 'Dos pinos', 2, 20.00),

       ('Leche descremada', 'ESTANTERIA',  'Dos pinos', 2, 25.00),

       ('Leche de almendras', 'ESTANTERIA', 'Dos pinos', 2, 27.00),

       ('Leche descremeda', 'ESTANTERIA', 'Foremost', 2, 30.00),

       ('Yogurt Griego', 'ESTANTERIA', 'Olkos', 2, 50.00),

       ('Crema dulce', 'ESTANTERIA', 'Dos pinos', 2, 10.00),

       ('Leche entera', 'ESTANTERIA', 'Lala', 2, 15.00),

       ('Leche descremada', 'ESTANTERIA', 'Lala', 2, 17.00),

       ('Leche de almendra', 'ESTANTERIA', 'Lala', 2, 23.75),

       ('Mayonesa', 'ESTANTERIA','Mi patrona', 2, 12.00),

       ('Mostaza', 'ESTANTERIA', 'Mi patrona', 2, 15.00),

       ('Mantequilla sin sal', 'ESTANTERIA', 'President', 2, 15.00),

       ('Galletas cookies & cream', 'ESTANTERIA', 'Oreo', 2, 20.00),

       ('Galletas de vainilla', 'ESTANTERIA', 'Oreo', 2, 22.00),

       ('Frituras de limón', 'ESTANTERIA', 'Tortrix', 2, 20.00),

       ('Frituras de barbacoa', 'ESTANTERIA', 'Tortrix', 2, 20.00),

       ('Frituras taco chilero', 'ESTANTERIA', 'Tortrix', 2, 25.00),

       ('Galletas de chocolate', 'ESTANTERIA', 'Chocowow', 2, 15.00),

       ('Nachos de queso', 'ESTANTERIA', 'Diana', 2, 8.00),

       ('Frituras queso y jalapeño', 'ESTANTERIA', 'Doritos', 2, 15.00),

       ('Papalinas clásicas', 'ESTANTERIA', 'Lays', 2, 10.00),

       ('Chocolates', 'ESTANTERIA', 'Ferrero Rocher', 2, 75.00),

       ('Galleta relleno de fresa', 'ESTANTERIA', 'Chiky', 2, 20.00),

       ('Jalapeños', 'ESTANTERIA', 'Diana', 2, 10.00),

       ('Papalinas crema y cebolla', 'ESTANTERIA', 'Pringles', 2, 56.00),

       ('Chicle de menta', 'ESTANTERIA', 'Trident', 2, 15.00),

       ('Chocolate oscuro tableta', 'ESTANTERIA', 'Granada', 2, 6.50),

       ('Nachos naturales', 'ESTANTERIA', 'Ya está', 2, 23.75),

       ('Chocolate caramelo', 'ESTANTERIA', 'Milka', 2, 25.25),

       ('Elotitos con limón', 'ESTANTERIA','Diana', 2, 10.00),

       ('Botonetas Peanut', 'ESTANTERIA', 'M&M', 2, 25.00),

       ('Chocolate strawberry', 'ESTANTERIA', 'Milka', 2, 25.00),

       ('Yuca barbacoa', 'ESTANTERIA', 'Diana', 2, 16.25),

       ('Galletas cremas', 'ESTANTERIA', 'Pozuelo', 2, 16.50);

INSERT INTO schema_inventory.products(product_name, product_state, brand, branch_office_id, price)
VALUES ('Azúcar', 'ESTANTERIA','La montaña', 3, 25.00),

       ('Sal', 'ESTANTERIA', 'Suli', 3, 5.00),

       ('Margarina', 'ESTANTERIA', 'Mazola', 3, 15.00),

       ('Arroz', 'ESTANTERIA', 'Gallo Dorado', 3, 20.00),

       ('Aceite', 'ESTANTERIA', 'Weson', 3, 25.00),

       ('Salchicha', 'ESTANTERIA', 'Bremen', 3, 10.00),

       ('Helado de Vainilla', 'ESTANTERIA', 'Foremost', 3, 35.00),

       ('Cloro', 'ESTANTERIA', 'Magia blanca', 3, 15.00),

       ('Detergente', 'ESTANTERIA', 'UltraKlin', 3, 5.00),

       ('Desinfectante', 'ESTANTERIA', 'Fabuloso', 3, 12.50),

       ('Desinfectante', 'ESTANTERIA', 'AJAX', 3, 17.50),

       ('Café clásico', 'ESTANTERIA', 'NesCafé', 3, 50.00),

       ('Coca-Cola 3L', 'ESTANTERIA', 'Coca-cola', 3, 15.00),

       ('Café instantáneo', 'ESTANTERIA', 'Musun', 3, 25.00),

       ('Coca-cola lata', 'ESTANTERIA', 'Coca-cola', 3, 5.00),

       ('Chocolate en polvo', 'ESTANTERIA', 'Nesquik', 3, 15.00),

       ('Jugo coctel picante', 'ESTANTERIA', 'Marinero', 3, 5.00),

       ('Jugo de naranja con pulpa', 'ESTANTERIA', 'La Granja', 3, 15.00),

       ('Gaseosa en lata', 'ESTANTERIA', 'Salutaris', 3, 5.00),

       ('Queso crema', 'ESTANTERIA', 'Philadelphia', 3, 15.00),

       ('Huevo blanco', 'ESTANTERIA', 'GuateHuevo', 3, 10.00),

       ('Jamón de pavo', 'ESTANTERIA', 'Toledo', 3, 16.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Fud', 3, 15.00),

       ('Salchicha polaca', 'ESTANTERIA', 'Santa lucía', 3, 25.00),

       ('Salami', 'ESTANTERIA', 'Bremen', 3, 15.00),

       ('Chorizo colorado', 'ESTANTERIA', 'Santa lucía', 3, 23.50),

       ('Jamón de pavo', 'ESTANTERIA', 'Chimex', 3, 25.00),

       ('Alas de pollo', 'ESTANTERIA', 'Pollo rey', 3, 3.00),

       ('Chuleta ahumada', 'ESTANTERIA', 'Don cristobal', 3, 25.00),

       ('Carne molida de pollo', 'ESTANTERIA', 'Pollo rey', 3, 20.00),

       ('Papel higiénico', 'ESTANTERIA', 'Suli', 3, 20.00),

       ('Pasta dental max white', 'ESTANTERIA', 'Colgate', 3, 15.00),

       ('Pasta dental triple acción', 'ESTANTERIA', 'Colgate', 3, 12.00),

       ('Papel higiénico triple hoja', 'ESTANTERIA', 'Rosal morado', 3, 100.00),

       ('Jabón líquido', 'ESTANTERIA', 'Olimpo', 3, 6.75),

       ('Barra antitraspirante', 'ESTANTERIA', 'Old spice', 3, 15.00),

       ('Enjuage bucal Plax Ice', 'ESTANTERIA', 'Colgate', 3, 35.00),

       ('Gel for men', 'ESTANTERIA', 'Ego', 3, 15.00),

       ('Jabón corporal', 'ESTANTERIA', 'Protex', 3, 33.00),

       ('mantequilla de maní', 'ESTANTERIA', 'B&B', 3, 20.00),

       ('Mermelada de mora', 'ESTANTERIA', 'B&B', 3, 15.00),

       ('Leche entera', 'ESTANTERIA', 'Dos pinos', 3, 20.00),

       ('Leche descremada', 'ESTANTERIA',  'Dos pinos', 3, 25.00),

       ('Leche de almendras', 'ESTANTERIA', 'Dos pinos', 3, 27.00),

       ('Leche descremeda', 'ESTANTERIA', 'Foremost', 3, 30.00),

       ('Yogurt Griego', 'ESTANTERIA', 'Olkos', 3, 50.00),

       ('Crema dulce', 'ESTANTERIA', 'Dos pinos', 3, 10.00),

       ('Leche entera', 'ESTANTERIA', 'Lala', 3, 15.00),

       ('Leche descremada', 'ESTANTERIA', 'Lala', 3, 17.00),

       ('Leche de almendra', 'ESTANTERIA', 'Lala', 3, 23.75),

       ('Mayonesa', 'ESTANTERIA','Mi patrona', 3, 12.00),

       ('Mostaza', 'ESTANTERIA', 'Mi patrona', 3, 15.00),

       ('Mantequilla sin sal', 'ESTANTERIA', 'President', 3, 15.00),

       ('Galletas cookies & cream', 'ESTANTERIA', 'Oreo', 3, 20.00),

       ('Galletas de vainilla', 'ESTANTERIA', 'Oreo', 3, 22.00),

       ('Frituras de limón', 'ESTANTERIA', 'Tortrix', 3, 20.00),

       ('Frituras de barbacoa', 'ESTANTERIA', 'Tortrix', 3, 20.00),

       ('Frituras taco chilero', 'ESTANTERIA', 'Tortrix', 3, 25.00),

       ('Galletas de chocolate', 'ESTANTERIA', 'Chocowow', 3, 15.00),

       ('Nachos de queso', 'ESTANTERIA', 'Diana', 3, 8.00),

       ('Frituras queso y jalapeño', 'ESTANTERIA', 'Doritos', 3, 15.00),

       ('Papalinas clásicas', 'ESTANTERIA', 'Lays', 3, 10.00),

       ('Chocolates', 'ESTANTERIA', 'Ferrero Rocher', 3, 75.00),

       ('Galleta relleno de fresa', 'ESTANTERIA', 'Chiky', 3, 20.00),

       ('Jalapeños', 'ESTANTERIA', 'Diana', 3, 10.00),

       ('Papalinas crema y cebolla', 'ESTANTERIA', 'Pringles', 3, 56.00),

       ('Chicle de menta', 'ESTANTERIA', 'Trident', 3, 15.00),

       ('Chocolate oscuro tableta', 'ESTANTERIA', 'Granada', 3, 6.50),

       ('Nachos naturales', 'ESTANTERIA', 'Ya está', 3, 23.75),

       ('Chocolate caramelo', 'ESTANTERIA', 'Milka', 3, 25.25),

       ('Elotitos con limón', 'ESTANTERIA','Diana', 3, 10.00),

       ('Botonetas Peanut', 'ESTANTERIA', 'M&M', 3, 25.00),

       ('Chocolate strawberry', 'ESTANTERIA', 'Milka', 3, 25.00),

       ('Yuca barbacoa', 'ESTANTERIA', 'Diana', 3, 16.25),

       ('Galletas cremas', 'ESTANTERIA', 'Pozuelo', 3, 16.50);

INSERT INTO schema_sales.bills(bill_date, client_nit, employee_id, branch_office_id, total_without_discount, total_with_discount)
VALUES ('2023-09-13', '109749538', 1, 1, 30.00, 30.00),
       ('2023-09-13', '135831143', 2, 1, 25.00, 25.00),
       ('2023-09-13', '306214331', 2, 1, 40.00, 40.00),
       ('2023-09-13', '907558831', 1, 1, 30.00, 30.00),
       ('2023-09-13', '306214331', 3, 1, 60.00, 60.00),

       ('2023-09-13', '495312209', 7, 2, 55.00, 55.00),
       ('2023-09-13', '495312209', 7, 2, 30.00, 30.00),
       ('2023-09-13', '109749538', 8, 2, 10.00, 10.00),
       ('2023-09-13', '554931023', 10, 2, 25.00, 25.00),
       ('2023-09-13', '554931023', 12, 2, 45.00, 45.00),

       ('2023-09-13', '109749538', 13, 3, 30.00, 30.00),
       ('2023-09-13', '495312209', 13, 3, 45.00, 45.00),
       ('2023-09-13', '867880432', 15, 3, 100.00, 100.00),
       ('2023-09-13', '109749538', 14, 3, 35.00, 35.00),
       ('2023-09-13', '867880432', 16, 3, 60.00, 60.00);

INSERT INTO schema_sales.sales_details(bill_id, product_id, product_amount)
VALUES (1, 321, 1),(1, 320, 1),
       (2, 311, 1),
       (3, 300, 1),(3, 301, 1),
       (4, 275, 1),(4, 273, 1),
       (5, 262, 1),(5, 256, 1),

       (6, 396, 1),(6, 369, 1),
       (7, 370, 1),(7, 368, 1),
       (8, 371, 1),
       (9, 374, 1),
       (10, 390, 1),(10, 393, 1),

       (11, 426, 1),(11, 427, 1),
       (12, 431, 1),(12, 432, 1),
       (13, 459, 1),
       (14, 462, 1),
       (15, 471, 1),(15, 472, 1);

UPDATE schema_inventory.products SET product_state='VENDIDO'
WHERE product_id = 321 OR product_id = 320 OR product_id = 311
OR product_id = 300 OR product_id = 301 OR product_id = 275
OR product_id = 273 OR product_id = 262 OR product_id = 256
OR product_id = 396 OR product_id = 369 OR product_id = 370
OR product_id = 368 OR product_id = 371 OR product_id = 374
OR product_id = 390 OR product_id = 393 OR product_id = 426
OR product_id = 427 OR product_id = 431 OR product_id = 432
OR product_id = 459 OR product_id = 462 OR product_id = 471
OR product_id = 472;
