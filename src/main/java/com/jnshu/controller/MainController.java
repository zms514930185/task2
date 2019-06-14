package com.jnshu.controller;

import com.jnshu.model.Student;
import com.jnshu.service.StudentService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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
        modelAndView.addObject("selectCountId", studentService.selectCount(student));
        /*根据传入参数进行查询*/
        logger.info("查询时传入的对象值：" + student);
        modelAndView.addObject("selectStudent", studentService.selectStudent(student, 1, 10));
        /*总页数totalPage：因为记录数是long型的，要转成double型做取整计算，做完以后把取到的数强转成long型。*/
        /*long totalPage = (long) Math.ceil((double) studentService.selectCountId() / 10);
        modelAndView.addObject("totalPage", totalPage);*/
        return modelAndView;
    }

    //在url里用?id=值&name=值的方式进行参数提交。
    @RequestMapping(value = "/select1", method = RequestMethod.GET)
    @ResponseBody
    public List<Student> selectId(Student student) {
        logger.info("查询对象值是 {}的记录", student);
        return studentService.selectStudent(student, 1, 10);
    }

    /*删除操作*/
    @RequestMapping(value = "/delete1", method = RequestMethod.DELETE)
    @ResponseBody
    public String deleteStudent(@RequestParam Student student, Model model) {
        /*根据传入参数进行删除*/
        logger.info("删除ID值为{}的记录", student.getId());
        model.addAttribute("deleteStudent", studentService.deleteByPrimaryKey(student.getId()));
        return "json-taglib";
    }


/*    @RequestMapping(value="/register",method=RequestMethod.POST)
    // 将请求中的loginname参数的值赋给loginname变量,password和username同样处理
    public String register(
            @RequestParam("loginname") String loginname,
            @RequestParam("password") String password,
            @RequestParam("username") String username) {
        logger.info("register POST方法被调用...");
        // 创建User对象
        User user = new User();
        user.setLoginname(loginname);
        user.setPassword(password);
        user.setUsername(username);
        // 模拟数据库存储User信息
        userList.add(user);
        // 跳转到登录页面
        return "loginForm";
    }*/

    /*更改操作*//*
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