package com.eston201.dao;

import com.eston201.entities.Student;

import java.util.List;

public interface IStudentDAO {

    List<Student> getStudents();
    void save(Student student);
    Student getStudent(int id);

    void deleteStudent(int id);
}
