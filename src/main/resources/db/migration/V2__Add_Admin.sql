INSERT INTO users (id, active, email, firstname, lastname, password, patronymic, username)
VALUES (1, true, 'basinskii_gv@vitebsk.beltelecom.by', 'Басинский', 'Георгий',
        '$2a$08$toy8kwubCDpl9L2gxwa3SOe6EDWAaXYdf800mF1PT9WodjdAEROA.', 'Владимирович', 'egorbas');

INSERT INTO user_role (user_id, roles)
VALUES (1, 'ADMIN'),
       (1, 'SERVICE_MANAGER'),
       (1, 'OPERATOR');