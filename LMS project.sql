create database library;
use library;

create table branch (
 branch_no int primary key,
    manager_id int,
    branch_address varchar(200),
    contact_no int
);

desc branch;

create table employee (
    emp_id int primary key,
    emp_name varchar(100),
    position varchar(50),
    salary decimal(10, 2),
    branch_no int,
    foreign key (branch_no) references branch(branch_no)
);

desc employee;

create table books (
    isbn varchar(20) primary key,
    book_title varchar(255),
    category varchar(100),
    rental_price decimal(10, 2),
    status enum('yes', 'no'),
    author varchar(100),
    publisher varchar(100)
);

desc books;

create table customer (
    customer_id int primary key,
    customer_name varchar(100),
    customer_address varchar(255),
    reg_date date
);

desc customer;

create table issuestatus (
    issue_id int primary key,
    issued_cust int,
    issued_book_name varchar(255),
    issue_date date,
    isbn_book varchar(20),
    foreign key (issued_cust) references customer(customer_id),
    foreign key (isbn_book) references books(isbn)
);

desc issuestatus;

create table returnstatus (
    return_id int primary key,
    return_cust int,
    return_book_name varchar(255),
    return_date date,
    isbn_book2 varchar(20),
    foreign key (return_cust) references customer(customer_id),
    foreign key (isbn_book2) references books(isbn)
);

desc returnstatus;

show tables;

insert into branch (branch_no, manager_id, branch_address, contact_no)
values
    (1, 101, '123 Main St, Bengaluru, Karnataka', 1234567890),
    (2, 102, '456 Oak St, Mumbai, Maharashtra', 1234567891),
    (3, 103, '789 Pine St, Delhi, Delhi', 1234567892),
    (4, 104, '101 Elm St, Kolkata, West Bengal', 1234567893),
    (5, 105, '234 Maple St, Chennai, Tamil Nadu', 1234567894),
    (6, 106, '567 Cedar St, Hyderabad, Telangana', 1234567895),
    (7, 107, '890 Birch St, Pune, Maharashtra', 1234567896),
    (8, 108, '123 Oak St, Ahmedabad, Gujarat', 1234567897),
    (9, 109, '456 Pine St, Surat, Gujarat', 1234567898),
    (10, 110, '789 Maple St, Jaipur, Rajasthan', 1234567899);
    
    SELECT * FROM branch;
    
insert into employee (emp_id, emp_name, position, salary, branch_no)
values
    (201, 'Aarav Patel', 'Manager', 60000.00, 1),
    (202, 'Advik Gupta', 'Assistant Manager', 45000.00, 1),
    (203, 'Aaradhya Sharma', 'Clerk', 35000.00, 2),
    (204, 'Ishaan Singh', 'Clerk', 35000.00, 2),
    (205, 'Vihaan Khan', 'Manager', 60000.00, 3),
    (206, 'Ananya Joshi', 'Assistant Manager', 45000.00, 3),
    (207, 'Diya Patel', 'Clerk', 35000.00, 4),
    (208, 'Reyansh Kumar', 'Clerk', 35000.00, 4),
    (209, 'Rudra Gupta', 'Manager', 60000.00, 5),
    (210, 'Aadhya Singh', 'Assistant Manager', 45000.00, 5);
    
SELECT * FROM employee;

    
insert into books (isbn, book_title, category, rental_price, status, author, publisher)
values
    ('9780132350884', 'Introduction to Algorithms', 'Computer Science', 25.00, 'yes', 'Thomas H. Cormen', 'MIT Press'),
    ('9781593276034', 'Eloquent JavaScript', 'Programming', 20.00, 'yes', 'Marijn Haverbeke', 'No Starch Press'),
    ('9780451524935', 'To Kill a Mockingbird', 'Fiction', 15.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
    ('9780141439563', 'Pride and Prejudice', 'Classic', 18.00, 'yes', 'Jane Austen', 'Penguin Books'),
    ('9780743273565', 'The Great Gatsby', 'Fiction', 17.00, 'yes', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons'),
    ('9780061120080', 'The Catcher in the Rye', 'Fiction', 16.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
    ('9780143134117', 'Educated', 'Biography', 22.00, 'yes', 'Tara Westover', 'Random House'),
    ('9780374533557', 'Sapiens: A Brief History of Humankind', 'History', 21.00, 'yes', 'Yuval Noah Harari', 'Harper'),
    ('9780345806977', 'The Handmaid\'s Tale', 'Science Fiction', 19.00, 'yes', 'Margaret Atwood', 'Anchor Books'),
    ('9780545010221', 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 20.00, 'yes', 'J.K. Rowling', 'Scholastic');

SELECT * FROM books;
    
insert into customer (customer_id, customer_name, customer_address, reg_date)
values
    (301, 'Aaradhya Patel', '123 Main St, Bengaluru, Karnataka', '2024-05-01'),
    (302, 'Ishaan Gupta', '456 Oak St, Mumbai, Maharashtra', '2024-05-02'),
    (303, 'Vihaan Sharma', '789 Pine St, Delhi, Delhi', '2024-05-03'),
    (304, 'Ananya Singh', '101 Elm St, Kolkata, West Bengal', '2024-05-04'),
    (305, 'Reyansh Khan', '234 Maple St, Chennai, Tamil Nadu', '2024-05-05'),
    (306, 'Diya Joshi', '567 Cedar St, Hyderabad, Telangana', '2024-05-06'),
    (307, 'Rudra Patel', '890 Birch St, Pune, Maharashtra', '2024-05-07'),
    (308, 'Aadhya Kumar', '123 Oak St, Ahmedabad, Gujarat', '2024-05-08'),
    (309, 'Aarav Gupta', '456 Pine St, Surat, Gujarat', '2024-05-09'),
    (310, 'Advik Singh', '789 Maple St, Jaipur, Rajasthan', '2024-05-10');
    
SELECT * FROM customer;

    
    insert into issuestatus (issue_id, issued_cust, issued_book_name, issue_date, isbn_book)
values
    (401, 301, 'Introduction to Algorithms', '2024-05-01', '9780132350884'),
    (402, 302, 'Eloquent JavaScript', '2024-05-02', '9781593276034'),
    (403, 303, 'To Kill a Mockingbird', '2024-05-03', '9780451524935'),
    (404, 304, 'Pride and Prejudice', '2024-05-04', '9780141439563'),
    (405, 305, 'The Great Gatsby', '2024-05-05', '9780743273565'),
    (406, 306, 'The Catcher in the Rye', '2024-05-06', '9780061120080'),
    (407, 307, 'Educated', '2024-05-07', '9780143134117'),
    (408, 308, 'Sapiens: A Brief History of Humankind', '2024-05-08', '9780374533557'),
    (409, 309, 'The Handmaid\'s Tale', '2024-05-09', '9780345806977'),
    (410, 310, 'Harry Potter and the Sorcerer\'s Stone', '2024-05-10', '9780545010221');
    
   SELECT * FROM issuestatus;

insert into returnstatus (return_id, return_cust, return_book_name, return_date, isbn_book2)
values
    (501, 301, 'Introduction to Algorithms', '2024-05-15', '9780132350884'),
    (502, 302, 'Eloquent JavaScript', '2024-05-16', '9781593276034'),
    (503, 303, 'To Kill a Mockingbird', '2024-05-17', '9780451524935'),
    (504, 304, 'Pride and Prejudice', '2024-05-18', '9780141439563'),
    (505, 305, 'The Great Gatsby', '2024-05-19', '9780743273565'),
    (506, 306, 'The Catcher in the Rye', '2024-05-20', '9780061120080'),
    (507, 307, 'Educated', '2024-05-21', '9780143134117'),
    (508, 308, 'Sapiens: A Brief History of Humankind', '2024-05-22', '9780374533557'),
    (509, 309, 'The Handmaid\'s Tale', '2024-05-23', '9780345806977'),
    (510, 310, 'Harry Potter and the Sorcerer\'s Stone', '2024-05-24', '9780545010221');
    
select * from returnstatus;

select book_title, category, rental_price from books where status = 'yes';

select emp_name, salary from employee order by salary desc;


select b.book_title, c.customer_name from books b
inner join issuestatus i on b.isbn = i.isbn_book
inner join customer c on i.issued_cust = c.customer_id;


select category, count(*) as total_books from books group by category;

select emp_name, position, salary from employee where salary > 50000;


select customer_name from customer where reg_date < '2022-01-01'
and customer_id not in (select issued_cust from issuestatus);


select branch_no, count(*) as total_employees from employee group by branch_no;



select distinct c.customer_name from customer c
join issuestatus i on c.customer_id = i.issued_cust
where month(i.issue_date) = 6 and year(i.issue_date) = 2023;


select book_title, category from books where category = 'history';

select branch_no, count(*) as total_employees from employee group by branch_no having count(*) > 5;


select e.emp_name, b.branch_address, e.position from employee e
join branch b on e.branch_no = b.branch_no where e.position = 'manager';

select distinct c.customer_name from customer c
join issuestatus i on c.customer_id = i.issued_cust
join books b on i.isbn_book = b.isbn
where b.rental_price > 20;

select distinct c.customer_name, b.book_title, b.rental_price from customer c
join issuestatus i on c.customer_id = i.issued_cust
join books b on i.isbn_book = b.isbn
where b.rental_price > 20;
