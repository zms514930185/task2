package com.jnshu.service;

import com.jnshu.model.Student;

import java.util.List;
import java.util.Map;

public interface StudentService {
    long deleteByPrimaryKey(Long id);

    Long insertStudent(Student student);

    List<Student> selectByPrimaryKey(Long id);

    List<Student> selectAll();

    long updateStudent(Student student);

    long selectCountId();

    List<Student> selectStudent(Student student,int page,int size);
}
