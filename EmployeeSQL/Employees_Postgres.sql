
alter table dept_emp 
    add constraint fk_dept_no
    foreign key (dept_no) 
    REFERENCES department (dept_no);
