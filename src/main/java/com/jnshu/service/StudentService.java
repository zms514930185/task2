package com.jnshu.service;

import com.jnshu.model.Student;

import java.util.List;

public interface StudentService {
    long deleteByPrimaryKey(Long id);

    Long insertStudent(Student student);

    List<Student> selectByPrimaryKey(Long id);

    List<Student> selectAll();

    long updateStudent(Student student);

    long selectCount(Student student);

    List<Student> selectStudent(Student student,long page,long size);
}
