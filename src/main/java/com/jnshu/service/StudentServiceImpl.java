package com.jnshu.service;

import com.jnshu.mapper.StudentMapper;
import com.jnshu.model.Student;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {

    private final Logger logger = LogManager.getLogger(this.getClass());

    @Resource
    private StudentMapper studentMapper;

    @Override
    public long deleteByPrimaryKey(Long id) {
        return studentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Long insertStudent(Student student) {
        student.setUpdateAt(System.currentTimeMillis());
        student.setCreateAt(System.currentTimeMillis());
        return studentMapper.insertStudent(student);
    }

    @Override
    public List<Student> selectByPrimaryKey(Long id) {
        return studentMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Student> selectAll() {
        return studentMapper.selectAll();
    }

    @Override
    public long updateStudent(Student student) {
        student.setUpdateAt(System.currentTimeMillis());
        return studentMapper.updateStudent(student);
    }

    @Override
    public long selectCount(Student student) {
        return studentMapper.selectCount(student);
    }

    @Override
    public List<Student> selectStudent(Student student,long page,long size) {
        logger.info("查询操作：传输至后端处理的值{}，页数{}，单页记录数{}" , student,page,size);
        Map<String, Object> map = new HashMap();
        map.put("id",student.getId());
        map.put("studentId",student.getStudentId());
        map.put("name",student.getName());
        map.put("qq",student.getQq());
        map.put("career",student.getCareer());
        map.put("data",student.getData());
        map.put("school",student.getSchool());
        map.put("link",student.getLink());
        map.put("declaration",student.getDeclaration());
        map.put("brother",student.getBrother());
        map.put("createAt",student.getCreateAt());
        map.put("updateAt",student.getUpdateAt());
        map.put("Start", (page - 1) * size);// 设置分页查询的起始值Start
        map.put("size", size);// 设置每一页查询条数
        logger.info("查询操作：service层增加分页数据后的值"+map);
        return studentMapper .selectStudent(map);
    }
}
