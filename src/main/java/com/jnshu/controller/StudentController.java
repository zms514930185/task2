package com.jnshu.controller;

import com.jnshu.model.Student;
import com.jnshu.service.StudentService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*@Controller注解标记此为处理请求的Controller类*/
@Controller
public class StudentController {
    /*调日志*/
    private final Logger logger = LogManager.getLogger(this.getClass());

    /*通过注解使用反射的功能创建service层的StudentService接口对象
    在这里创建了一个studentService对象
    * 使用studentService对象就可以调StudentService接口的方法*/
    @Autowired
    StudentService studentService;

    /*用于定义一个请求映射,value为接收请求的url,index一般是主页*/
    @RequestMapping(value = "/")
    public String index() {
        //处理完请求返回的页面视图,此请求返回的是index.jsp视图
        return "index";
    }

    /*@RequestMapping：定义一个接口,在这里我自己定义为一个查询接口
    value:接收从/student这个地址来的数据
    method：使用GET类型的请求方式，在REST风格里还有修改：PUT、增加：POST、删除：DELETE*/
    /*@RequestMapping(value = "/student", method = RequestMethod.GET)

     *//*String:String类型的方法，最后返回的字符串代表了一个JSP视图。即执行完方法后返回的视图
     * 创建了一个Model类对象为model和实体类Student的student对象*//*
    public void selectStudent(Model model, Student student) {

        long selectCount=studentService.selectCount(student);
        *//*获取表格的记录数*//*
        logger.info("查询操作：返回前端的记录数" + selectCount);
        model.addAttribute("selectCountId", selectCount);

        *//*使用日志功能接收页面中的数据，查看是否正常*//*
        logger.info("查询操作：前端传入对象内的值" + student);

        *//*通过model对象调Model接口里的addAttribute方法，试图看源码，没成功，只知道最终实现的是map接口
     * "selectStudent"相当于键，对应写在jsp视图中的${selectCountId}
     * studentService.selectStudent(student)相当于与键对应的值
     * 即在JSP视图中写${selectCountId}可以调studentService.selectStudent(student)的返回值
     * studentService.selectStudent(student)是我自己写的查询方法*//*

        model.addAttribute("selectStudent", studentService.selectStudent(student, 1, 10));

        *//*总页数totalPage：因为记录数是long型的，要转成double型做取整计算，做完以后把取到的数强转成long型。*//*
        long totalPage = (long) Math.ceil((double) selectCount / 10);
        model.addAttribute("totalPage", totalPage);
    }*/

    /*查询接口*/
    @RequestMapping(value = "student", method = RequestMethod.GET)
    public String selectStudent(Student student, Model model,
                                @RequestParam(value = "page", required = false) Long page,
                                @RequestParam(value = "size", required = false) Long size) {
        /*如果未设置page与size值，将给这两个值赋初始值*/
        if (page == null) {
            page = 1L;
        }
        if (size == null) {
            size = 10L;
        }
        /*获取总记录数*/
        long selectCount = studentService.selectCount(student);
        model.addAttribute("count", selectCount);
        logger.info("共{}条记录", selectCount);
        /*获取总页数*/
        long totalPage = (long) Math.ceil((double) selectCount / size);
        logger.info("共{}页", totalPage);
        /*返回总页数*/
        model.addAttribute("totalPage", totalPage);

        /*判断首页、尾页page的值*/
        if (page >= totalPage) {
            page = totalPage;
        } else if (page <= 0) {
            page = 1L;
        }
        /*返回页数与单页记录数*/
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        /*上一页与下一页的page的值*/
        model.addAttribute("pageAdd", page + 1);
        model.addAttribute("pageMinus", page - 1);
        /*返回查询的对象*/
        logger.info("查询:{}", student);
        model.addAttribute("student", student);
        /*返回查询后的对象*/
        logger.info("查询:{},页数{},单页记录数{}", student, page, size);
        model.addAttribute("select", studentService.selectStudent(student, page, size));
        return "student";
    }

    /*    *//*定义一个删除接口*//*
    @RequestMapping(value = "/student", method = RequestMethod.DELETE)
    public String deleteStudent(Model model, Student student) {
        logger.info("删除：id值" + student.getId());
        model.addAttribute(studentService.deleteByPrimaryKey(student.getId()));
        return "redirect:student";
    }*/
    /*定义一个删除接口*/
    @RequestMapping(value = "/student", method = RequestMethod.DELETE)
    public String deleteStudent(Student student) {
        logger.info("删除：id值" + student.getId());
        studentService.deleteByPrimaryKey(student.getId());
        return "redirect:student";
    }

    /*错误视图*/
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String errorStudent() {
        return "error";
    }

    /*定义一个增加接口*/
    @RequestMapping(value = "/student", method = RequestMethod.POST)
    public String insertStudent(Model model, @Validated Student student, BindingResult bindingResult) {
        Map<String, Object> jsonValidated = new HashMap();
        if (bindingResult.hasErrors()) {
            logger.info("校验出错");
            List<ObjectError> errorList = bindingResult.getAllErrors();
            jsonValidated.put("校验错误数", errorList.size());
            int i = 1;
            for (ObjectError error : errorList) {
                //输出错误信息
                jsonValidated.put("错误提示" + i, error.getDefaultMessage());
                jsonValidated.put("错误类型" + i, error.getCode());
                i++;
            }
            model.addAttribute("error", jsonValidated);
            logger.info("校验结果{}", jsonValidated);
            return "error";
        } else {
            logger.info("增加：对象内的值" + student);
            model.addAttribute(studentService.insertStudent(student));
            return "redirect:student";
        }
    }


    /*定义一个修改接口*/
    @RequestMapping(value = "/student", method = RequestMethod.PUT)
    public String updateStudent(Model model, Student student) {
        logger.info("修改：对象内的值" + student);
        model.addAttribute(studentService.updateStudent(student));
        return "redirect:student";
    }
}
