package com.jnshu.controller;

import com.jnshu.model.Student;
import com.jnshu.service.StudentService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

// 此注解定义该类为处理请求的Controller类
@Controller
public class MainController {
    private final Logger logger = LogManager.getLogger(this.getClass());

    @Autowired
    StudentService studentService;


    /*查询与删除操作
     * @RequestMapping：指定URL路径
     * method = RequestMethod.GET 请求类型
     * ModelAndView:带视图与跳转
     * addObject:
     * */
    @RequestMapping(value = "/selectStudent")
    public ModelAndView selectStudent(Student student) {
        ModelAndView modelAndView = new ModelAndView("/json-taglib");
        /*获取表格的记录数*/
        modelAndView.addObject("selectCountId", studentService.selectCountId());
        /*根据传入参数进行查询*/
        logger.info("查询时传入的对象值：" + student);
        modelAndView.addObject("selectStudent", studentService.selectStudent(student,1,10));
        /*总页数totalPage：因为记录数是long型的，要转成double型做取整计算，做完以后把取到的数强转成long型。*/
        /*long totalPage = (long) Math.ceil((double) studentService.selectCountId() / 10);
        modelAndView.addObject("totalPage", totalPage);*/
        return modelAndView;
    }

    /*删除操作*//*
    @RequestMapping(value = "/selectStudent/delete{id}", method = RequestMethod.DELETE)
    public String deleteStudent(@PathVariable ("id")  Long id) {
        try {
            *//*根据传入参数进行删除*//*
            logger.info("删除时传入的ID值：" + id);
            studentService.deleteByPrimaryKey(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/selectStudent.jsp";
    }

    *//*更改操作*//*
    @RequestMapping(value = "/selectStudent/update", method = RequestMethod.PUT)
    public ModelAndView updateStudent(Student student) {
        ModelAndView modelAndView = new ModelAndView("/updateStudent.jsp");
        logger.info("更改时传入的对象值：" + student);
        studentService.updateStudent(student);
        return modelAndView;
    }

    *//*更改操作*//*
    *//*@RequestMapping(value = "/selectStudent/update", method = RequestMethod.PUT)
    public String updateStudent(Student student) {
        try {
            logger.info("更新时传入的值：" + student);
            System.out.println(student);
            studentService.updateStudent(student);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/selectStudent";
    }*//*

    *//*增加操作*//*
    @RequestMapping(value = "/insertStudent", method = RequestMethod.POST)
    public ModelAndView insertStudent(Student student) {
        ModelAndView modelAndView = new ModelAndView("/insertStudent.jsp");
        logger.info("增加参数为" + student);
        if (student.getStudentId() != null) {
            modelAndView.addObject("insertStudent", studentService.insertStudent(student));
        }
        return modelAndView;
    }*/
}