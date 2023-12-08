--Блок добавления сетей магазинов
INSERT into store_chain (id, name)
VALUES (default, 'Троечка');
INSERT into store_chain (id, name)
VALUES (default, 'Металл');
INSERT into store_chain (id, name)
VALUES (default, 'Проспект');

--Блок добавления магазинов
INSERT into store (id, address, store_chain_id)
VALUES (default, 'Сюдыкины Горы, 1', 1);
INSERT into store (id, address, store_chain_id)
VALUES (default, 'Кудыкины горы, 1', 1);

INSERT into store (id, address, store_chain_id)
VALUES (default, 'Сюдыкины Горы, 2', 2);
INSERT into store (id, address, store_chain_id)
VALUES (default, 'Кудыкины горы, 2', 2);

INSERT into store (id, address, store_chain_id)
VALUES (default, 'Сюдыкины Горы, 3',3);
INSERT into store (id, address, store_chain_id)
VALUES (default, 'Кудыкины горы, 3',3);

--Блок создания складов
INSERT into storage (id, store_id, max_items, storage_temperature)
VALUES (default, 1, 100, 20);
INSERT into storage (id, store_id, max_items, storage_temperature)
VALUES (default, 2, 100, -20);
INSERT into storage (id, store_id, max_items, storage_temperature)
VALUES (default, 2, 100, 20);
INSERT into storage (id, store_id, max_items, storage_temperature)
VALUES (default, 2, 100, -20);
INSERT into storage (id, store_id, max_items, storage_temperature)
VALUES (default, 3, 100, 20);
INSERT into storage (id, store_id, max_items, storage_temperature)
VALUES (default, 4, 100, -20);

--Блок добавления сотрудников
INSERT into employee (id, role)
VALUES (default, 'Грузчик 1');
INSERT into employee (id, role)
VALUES (default, 'Грузчик 2');
INSERT into employee (id, role)
VALUES (default, 'Грузчик 3');
INSERT into employee (id, role)
VALUES (default, 'Грузчик 4');
INSERT into employee (id, role)
VALUES (default, 'Грузчик 5');
INSERT into employee (id, role)
VALUES (default, 'Грузчик 6');
INSERT into employee (id, role)
VALUES (default, 'Грузчик 7');
INSERT into employee (id, role)
VALUES (default, 'Грузчик 8');

--Блок добавления техники
INSERT into machine (id, storage_id, employee_id, load_capacity)
VALUES (default, 1, 1, 8);
INSERT into machine (id, storage_id, employee_id, load_capacity)
VALUES (default, 2, 2, 5);
INSERT into machine (id, storage_id, employee_id, load_capacity)
VALUES (default, 2, 3, 5);
INSERT into machine (id, storage_id, employee_id, load_capacity)
VALUES (default, 3, 4, 5);
INSERT into machine (id, storage_id, employee_id, load_capacity)
VALUES (default, 4, 5, 5);
INSERT into machine (id, storage_id, employee_id, load_capacity)
VALUES (default, 4, 6, 5);
INSERT into machine (id, storage_id, employee_id, load_capacity)
VALUES (default, 5, 7, 8);
INSERT into machine (id, storage_id, employee_id, load_capacity)
VALUES (default, 6, 8, 8);

--Блок добавления наименований товаров
INSERT into title (id, value)
VALUES (default, 'макароны "Такие птичкой"');
INSERT into title (id, value)
VALUES (default, 'молоко "Божественное вмешательство"');
INSERT into title (id, value)
VALUES (default, 'мука "Уволка"');
INSERT into title (id, value)
VALUES (default, 'бекон "Добро пожаловать"');

--Блок добавления поставщиков
INSERT into provider (id, name, title_id, item_value)
VALUES (default, 'Село Верхние птички', 1, 100);

INSERT into provider (id, name, title_id, item_value)
VALUES (default, 'Рога и копыта', 2, 100);

INSERT into provider (id, name, title_id, item_value)
VALUES (default, 'Уволка', 3, 100);

INSERT into provider (id, name, title_id, item_value)
VALUES (default, 'Рога и копыта', 3, 100);

INSERT into provider (id, name, title_id, item_value)
VALUES (default, 'Рога и копыта', 5, 100);

--Блок добавления предметов
INSERT into item(id, title_id, storage_temperature, expiration_date, storage_id)
VALUES (default, 1, 15, NOW(), 1);
