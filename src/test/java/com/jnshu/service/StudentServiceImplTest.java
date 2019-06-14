package com.jnshu.service;

import com.jnshu.model.Student;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import static org.junit.jupiter.api.Assertions.*;

class StudentServiceImplTest {

    private final Logger logger = LogManager.getLogger(this.getClass());
    private ApplicationContext zms = new ClassPathXmlApplicationContext("applicationContext.xml");
    StudentService service = zms.getBean(StudentService.class);
    /*批量增加记录*/
    @Test
    void insertStudent() {
        try {
            long t = System.currentTimeMillis();
            Student student = new Student();
            for (int j = 1; j <= 100; j++) {
                for (long i = 1; i <= 1; i++) {
                    Random random = new Random();
                    student.setId(null);
                    student.setStudentId((long)random.nextInt(9999)+10000);
                    student.setName("柴柴柴生");
                    student.setQq(582721701L);
                    student.setCareer("产品经");
                    student.setData(1555430400000L);
                    student.setSchool("信阳师范学院");
                    student.setLink("https://www.jnshu.com/school/35937/daily");
                    student.setDeclaration("励志成为行业精");
                    student.setBrother("程一");
                    student.setCreateAt(System.currentTimeMillis());
                    student.setUpdateAt(System.currentTimeMillis());
                    //logger.info("第" + i + "次增加记录");
                }
                logger.info("增加的对象{}",student);
                service.insertStudent(student);
                long t1 = System.currentTimeMillis() - t;
                //logger.info("第"+j+"次循环增加记录结束，共耗时" + t1 + "毫秒");
            }
            long t2 = System.currentTimeMillis() - t;
            logger.info("结束循环增加记录，共耗时" + t2 + "毫秒");
        } catch (Exception e) {
            logger.error("循环记录操作错误");
        }
    }

    /*查询记录数*/
    @Test
    void selectStudent(){
        Student student=new Student();
        student.setId(null);
        student.setStudentId(null);
        student.setName(null);
        student.setQq(null);
        student.setCareer(null);
        student.setData(null);
        student.setSchool(null);
        student.setLink(null);
        student.setDeclaration(null);
        student.setBrother(null);
        student.setCreateAt(null);
        student.setUpdateAt(1557059664885L);
        logger.info("查询{}对象的记录数",student);
        service.selectCount(student);
        logger.info("查询出的记录数{}",service.selectCount(student));
    }
}