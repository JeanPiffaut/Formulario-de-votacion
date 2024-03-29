CREATE DATABASE `vote_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

create table vote_db.regions
(
    id   int auto_increment
        primary key,
    name varchar(255) not null
);

create table vote_db.communes
(
    id        int auto_increment
        primary key,
    name      varchar(255) not null,
    region_id int          null,
    constraint communes_ibfk_1
        foreign key (region_id) references vote_db.regions (id) on update cascade
);

create table if not exists vote_db.presidential_candidates
(
    id   int auto_increment
        primary key,
    name varchar(255) not null
);

create table vote_db.votes
(
    id           int auto_increment
        primary key,
    name         varchar(255) not null,
    alias        varchar(255) not null,
    rut          varchar(20)  not null,
    email        varchar(255) not null,
    commune_id   int          null,
    region_id    int          null,
    candidate_id int          null,
    web          tinyint(1)   null,
    tv           tinyint(1)   null,
    social_media tinyint(1)   null,
    friend       tinyint(1)   null,
    constraint votes_ibfk_1
        foreign key (commune_id) references vote_db.communes (id),
    constraint votes_ibfk_2
        foreign key (region_id) references vote_db.regions (id),
    constraint votes_ibfk_3
        foreign key (candidate_id) references vote_db.presidential_candidates (id)
);

create index region_id
    on vote_db.communes (region_id);

create index candidate_id
    on vote_db.votes (candidate_id);

create index commune_id
    on vote_db.votes (commune_id);

create index region_id
    on vote_db.votes (region_id);

INSERT INTO vote_db.regions (id, name) VALUES (1, 'Región Metropolitana de Santiago');
INSERT INTO vote_db.regions (id, name) VALUES (2, 'Arica y Parinacota');
INSERT INTO vote_db.regions (id, name) VALUES (3, 'Tarapacá');
INSERT INTO vote_db.regions (id, name) VALUES (4, 'Antofagasta');
INSERT INTO vote_db.regions (id, name) VALUES (5, 'Atacama');
INSERT INTO vote_db.regions (id, name) VALUES (6, 'Coquimbo');
INSERT INTO vote_db.regions (id, name) VALUES (7, 'Valparaíso');
INSERT INTO vote_db.regions (id, name) VALUES (8, 'Región del Libertador Gral. Bernardo O’Higgins');
INSERT INTO vote_db.regions (id, name) VALUES (9, 'Región del Maule');
INSERT INTO vote_db.regions (id, name) VALUES (10, 'Región de Ñuble');
INSERT INTO vote_db.regions (id, name) VALUES (11, 'Región del Biobío');
INSERT INTO vote_db.regions (id, name) VALUES (12, 'Región de la Araucanía');
INSERT INTO vote_db.regions (id, name) VALUES (13, 'Región de Los Ríos');
INSERT INTO vote_db.regions (id, name) VALUES (14, 'Región de Los Lagos');
INSERT INTO vote_db.regions (id, name) VALUES (15, 'Región Aisén del Gral. Carlos Ibáñez del Campo');
INSERT INTO vote_db.regions (id, name) VALUES (16, 'Región de Magallanes y de la Antártica Chilena');

INSERT INTO vote_db.communes (id, name, region_id) VALUES (1, 'Arica', 2);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (2, 'Camarones', 2);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (3, 'Putre', 2);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (4, 'General Lagos', 2);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (5, 'Iquique', 3);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (6, 'Alto Hospicio', 3);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (7, 'Pozo Almonte', 3);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (8, 'Camiña', 3);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (9, 'Colchane', 3);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (10, 'Huara', 3);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (11, 'Pica', 3);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (12, 'Antofagasta', 4);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (13, 'Mejillones', 4);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (14, 'Sierra Gorda', 4);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (15, 'Taltal', 4);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (16, 'Calama', 4);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (17, 'Ollagüe', 4);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (18, 'San Pedro de Atacama', 4);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (19, 'Tocopilla', 4);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (20, 'María Elena', 4);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (21, 'Copiapó', 5);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (22, 'Caldera', 5);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (23, 'Tierra Amarilla', 5);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (24, 'Chañaral', 5);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (25, 'Diego de Almagro', 5);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (26, 'Vallenar', 5);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (27, 'Alto del Carmen', 5);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (28, 'Freirina', 5);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (29, 'Huasco', 5);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (30, 'La Serena', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (31, 'Coquimbo', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (32, 'Andacollo', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (33, 'La Higuera', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (34, 'Paiguano', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (35, 'Vicuña', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (36, 'Illapel', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (37, 'Canela', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (38, 'Los Vilos', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (39, 'Salamanca', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (40, 'Ovalle', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (41, 'Combarbalá', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (42, 'Monte Patria', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (43, 'Punitaqui', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (44, 'Río Hurtado', 6);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (45, 'Valparaíso', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (46, 'Casablanca', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (47, 'Concón', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (48, 'Juan Fernández', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (49, 'Puchuncaví', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (50, 'Quintero', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (51, 'Viña del Mar', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (52, 'Isla de Pascua', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (53, 'Los Andes', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (54, 'Calle Larga', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (55, 'Rinconada', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (56, 'San Esteban', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (57, 'La Ligua', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (58, 'Cabildo', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (59, 'Papudo', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (60, 'Petorca', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (61, 'Zapallar', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (62, 'Quillota', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (63, 'Calera', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (64, 'Hijuelas', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (65, 'La Cruz', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (66, 'Nogales', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (67, 'San Antonio', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (68, 'Algarrobo', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (69, 'Cartagena', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (70, 'El Quisco', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (71, 'El Tabo', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (72, 'Santo Domingo', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (73, 'San Felipe', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (74, 'Catemu', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (75, 'Llaillay', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (76, 'Panquehue', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (77, 'Putaendo', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (78, 'Santa María', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (79, 'Quilpué', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (80, 'Limache', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (81, 'Olmué', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (82, 'Villa Alemana', 7);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (83, 'Rancagua', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (84, 'Codegua', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (85, 'Coinco', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (86, 'Coltauco', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (87, 'Doñihue', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (88, 'Graneros', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (89, 'Las Cabras', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (90, 'Machalí', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (91, 'Malloa', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (92, 'Mostazal', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (93, 'Olivar', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (94, 'Peumo', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (95, 'Pichidegua', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (96, 'Quinta de Tilcoco', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (97, 'Rengo', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (98, 'Requínoa', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (99, 'San Vicente', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (100, 'Pichilemu', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (101, 'La Estrella', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (102, 'Litueche', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (103, 'Marchihue', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (104, 'Navidad', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (105, 'Paredones', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (106, 'San Fernando', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (107, 'Chépica', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (108, 'Chimbarongo', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (109, 'Lolol', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (110, 'Nancagua', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (111, 'Palmilla', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (112, 'Peralillo', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (113, 'Placilla', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (114, 'Pumanque', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (115, 'Santa Cruz', 8);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (116, 'Talca', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (117, 'Constitución', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (118, 'Curepto', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (119, 'Empedrado', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (120, 'Maule', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (121, 'Pelarco', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (122, 'Pencahue', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (123, 'Río Claro', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (124, 'San Clemente', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (125, 'San Rafael', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (126, 'Cauquenes', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (127, 'Chanco', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (128, 'Pelluhue', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (129, 'Curicó', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (130, 'Hualañé', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (131, 'Licantén', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (132, 'Molina', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (133, 'Rauco', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (134, 'Romeral', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (135, 'Sagrada Familia', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (136, 'Teno', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (137, 'Vichuquén', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (138, 'Linares', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (139, 'Colbún', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (140, 'Longaví', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (141, 'Parral', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (142, 'Retiro', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (143, 'San Javier', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (144, 'Villa Alegre', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (145, 'Yerbas Buenas', 9);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (146, 'Cobquecura', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (147, 'Coelemu', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (148, 'Ninhue', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (149, 'Portezuelo', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (150, 'Quirihue', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (151, 'Ránquil', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (152, 'Treguaco', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (153, 'Bulnes', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (154, 'Chillán Viejo', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (155, 'Chillán', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (156, 'El Carmen', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (157, 'Pemuco', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (158, 'Pinto', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (159, 'Quillón', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (160, 'San Ignacio', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (161, 'Yungay', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (162, 'Coihueco', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (163, 'Ñiquén', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (164, 'San Carlos', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (165, 'San Fabián', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (166, 'San Nicolás', 10);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (167, 'Concepción', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (168, 'Coronel', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (169, 'Chiguayante', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (170, 'Florida', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (171, 'Hualqui', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (172, 'Lota', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (173, 'Penco', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (174, 'San Pedro de la Paz', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (175, 'Santa Juana', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (176, 'Talcahuano', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (177, 'Tomé', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (178, 'Hualpén', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (179, 'Lebu', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (180, 'Arauco', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (181, 'Cañete', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (182, 'Contulmo', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (183, 'Curanilahue', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (184, 'Los Álamos', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (185, 'Tirúa', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (186, 'Los Ángeles', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (187, 'Antuco', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (188, 'Cabrero', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (189, 'Laja', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (190, 'Mulchén', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (191, 'Nacimiento', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (192, 'Negrete', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (193, 'Quilaco', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (194, 'Quilleco', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (195, 'San Rosendo', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (196, 'Santa Bárbara', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (197, 'Tucapel', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (198, 'Yumbel', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (199, 'Alto Biobío', 11);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (200, 'Temuco', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (201, 'Carahue', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (202, 'Cunco', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (203, 'Curarrehue', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (204, 'Freire', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (205, 'Galvarino', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (206, 'Gorbea', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (207, 'Lautaro', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (208, 'Loncoche', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (209, 'Melipeuco', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (210, 'Nueva Imperial', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (211, 'Padre las Casas', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (212, 'Perquenco', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (213, 'Pitrufquén', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (214, 'Pucón', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (215, 'Saavedra', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (216, 'Teodoro Schmidt', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (217, 'Toltén', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (218, 'Vilcún', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (219, 'Villarrica', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (220, 'Cholchol', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (221, 'Angol', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (222, 'Collipulli', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (223, 'Curacautín', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (224, 'Ercilla', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (225, 'Lonquimay', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (226, 'Los Sauces', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (227, 'Lumaco', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (228, 'Purén', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (229, 'Renaico', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (230, 'Traiguén', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (231, 'Victoria', 12);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (232, 'Valdivia', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (233, 'Corral', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (234, 'Lanco', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (235, 'Los Lagos', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (236, 'Máfil', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (237, 'Mariquina', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (238, 'Paillaco', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (239, 'Panguipulli', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (240, 'La Unión', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (241, 'Futrono', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (242, 'Lago Ranco', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (243, 'Río Bueno', 13);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (244, 'Puerto Montt', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (245, 'Calbuco', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (246, 'Cochamó', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (247, 'Fresia', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (248, 'Frutillar', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (249, 'Los Muermos', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (250, 'Llanquihue', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (251, 'Maullín', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (252, 'Puerto Varas', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (253, 'Castro', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (254, 'Ancud', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (255, 'Chonchi', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (256, 'Curaco de Vélez', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (257, 'Dalcahue', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (258, 'Puqueldón', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (259, 'Queilén', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (260, 'Quellón', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (261, 'Quemchi', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (262, 'Quinchao', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (263, 'Osorno', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (264, 'Puerto Octay', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (265, 'Purranque', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (266, 'Puyehue', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (267, 'Río Negro', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (268, 'San Juan de la Costa', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (269, 'San Pablo', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (270, 'Chaitén', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (271, 'Futaleufú', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (272, 'Hualaihué', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (273, 'Palena', 14);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (274, 'Coihaique', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (275, 'Lago Verde', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (276, 'Aisén', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (277, 'Cisnes', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (278, 'Guaitecas', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (279, 'Cochrane', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (280, 'O’Higgins', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (281, 'Tortel', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (282, 'Chile Chico', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (283, 'Río Ibáñez', 15);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (284, 'Punta Arenas', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (285, 'Laguna Blanca', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (286, 'Río Verde', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (287, 'San Gregorio', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (288, 'Cabo de Hornos (Ex Navarino)', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (289, 'Antártica', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (290, 'Porvenir', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (291, 'Primavera', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (292, 'Timaukel', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (293, 'Natales', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (294, 'Torres del Paine', 16);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (295, 'Cerrillos', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (296, 'Cerro Navia', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (297, 'Conchalí', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (298, 'El Bosque', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (299, 'Estación Central', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (300, 'Huechuraba', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (301, 'Independencia', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (302, 'La Cisterna', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (303, 'La Florida', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (304, 'La Granja', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (305, 'La Pintana', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (306, 'La Reina', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (307, 'Las Condes', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (308, 'Lo Barnechea', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (309, 'Lo Espejo', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (310, 'Lo Prado', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (311, 'Macul', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (312, 'Maipú', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (313, 'Ñuñoa', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (314, 'Pedro Aguirre Cerda', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (315, 'Peñalolén', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (316, 'Providencia', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (317, 'Pudahuel', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (318, 'Quilicura', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (319, 'Quinta Normal', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (320, 'Recoleta', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (321, 'Renca', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (322, 'Santiago', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (323, 'San Joaquín', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (324, 'San Miguel', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (325, 'San Ramón', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (326, 'Vitacura', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (327, 'Puente Alto', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (328, 'Pirque', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (329, 'San José de Maipo', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (330, 'Colina', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (331, 'Lampa', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (332, 'Tiltil', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (333, 'San Bernardo', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (334, 'Buin', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (335, 'Calera de Tango', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (336, 'Paine', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (337, 'Melipilla', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (338, 'Alhué', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (339, 'Curacaví', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (340, 'María Pinto', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (341, 'San Pedro', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (342, 'Talagante', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (343, 'El Monte', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (344, 'Isla de Maipo', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (345, 'Padre Hurtado', 1);
INSERT INTO vote_db.communes (id, name, region_id) VALUES (346, 'Peñaflor', 1);

INSERT INTO vote_db.presidential_candidates (id, name) VALUES (1, 'Gabriel Boric');
INSERT INTO vote_db.presidential_candidates (id, name) VALUES (2, 'José Antonio Kast');
INSERT INTO vote_db.presidential_candidates (id, name) VALUES (3, 'Yasna Provoste');
INSERT INTO vote_db.presidential_candidates (id, name) VALUES (4, 'Sebastián Sichel');
INSERT INTO vote_db.presidential_candidates (id, name) VALUES (5, 'Eduardo Artés');
INSERT INTO vote_db.presidential_candidates (id, name) VALUES (6, 'Marco Enríquez-Ominami');
INSERT INTO vote_db.presidential_candidates (id, name) VALUES (7, 'Franco Parisi Fernández');
