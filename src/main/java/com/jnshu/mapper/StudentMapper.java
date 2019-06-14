package com.jnshu.mapper;

import com.jnshu.model.Student;


import java.util.List;
import java.util.Map;

public interface StudentMapper {
    /*删*/
    long deleteByPrimaryKey(Long id);
    /*增*/
    Long insertStudent(Student student);
    /*查*/
    List<Student> selectStudent(Map<String,Object> map);

    /*改*/
    long updateStudent(Student student);
    /*查记录数*/
    long selectCount(Student student);
    /*根据主键查询*/
    List<Student> selectByPrimaryKey(Long id);
    /*查询整张表*/
    List<Student> selectAll();
}