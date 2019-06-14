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
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class StudentWebController {
    /*调日志*/
    private final Logger logger = LogManager.getLogger(this.getClass());
    /*使用注解调service层*/
    @Autowired
    StudentService studentService;

    /*查询接口*/
    @RequestMapping(value = "select", method = RequestMethod.GET)
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
        return "select";
    }

    /*获取增加接口视图*/
    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String insertJsp() {
        return "insert";
    }

    /*增加接口*/
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insertStudent(@Validated Student student, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "error";
        } else {
            logger.info("增加:{}", student);
            studentService.insertStudent(student);
            return "insert";
        }
    }

    /*获取删除接口视图*/
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String deleteJsp() {
        return "delete";
    }

    /*删除接口*/
    @RequestMapping(value = "delete", method = RequestMethod.DELETE)
    public void deleteStudent(Student student) {
        logger.info("删除:{}", student);
        studentService.deleteByPrimaryKey(student.getId());
    }

    /*获取修改接口视图*/
    @RequestMapping(value = "update", method = RequestMethod.GET)
    public String updateJsp() {
        return "update";
    }

    /*获取修改的对象*/
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String updateSelectStudent(Student student, Model model) {
        logger.info("要修改的对象:{}", student);
        model.addAttribute("updateSelectStudent", student);
        return "update";
    }

    /*修改接口*/
    @RequestMapping(value = "update", method = RequestMethod.PUT)
    public String updateStudent(Student student) {
        logger.info("修改:{}", student);
        studentService.updateStudent(student);
        return "redirect:select";
    }

    /*测试JSON，带视图*/
    /*@RequestMapping(value = "json",method = RequestMethod.GET)
    public String jsonJSP(){
        return "json";
    }
    @RequestMapping(value = "json", method = RequestMethod.POST)
    public void testJson(@RequestBody Student student, Model model) {
        model.addAttribute("jsonStudent",studentService.selectStudent(student, 1, 10));
    }*/

    /*前端提交JSON数据，后端返回JSON数据*/
    /*请求地址与请求方式*/
    @RequestMapping(value = "json", method = RequestMethod.POST)

    /*用@ResponseBody返回JSON数据到前端*/
    @ResponseBody

    /*用@RequestBody接收前端传来的JSON数据，这里是对象*/
    public List<Student> testJson(@RequestBody Student student) {
        /*接收对象，进行查询，写死页数为1，单页记录数为10*/
        return studentService.selectStudent(student, 1, 10);
    }


    @RequestMapping(value = "Validated", method = RequestMethod.POST, produces="application/json")
    @ResponseBody
    /*用@RequestBody接收前端传来的JSON数据，这里是对象*/
    public Map<String, Object> validated(@RequestBody @Validated Student student, BindingResult bindingResult) {
        Map<String, Object> jsonValidated = new HashMap();
        if (bindingResult.hasErrors()) {
            logger.info("校验出错");
            List<ObjectError> errorList = bindingResult.getAllErrors();
            int codeSize = errorList.size();
            jsonValidated.put("codeSize",codeSize);
            int i=1;
            for (ObjectError error : errorList) {
                //输出错误信息
                jsonValidated.put("message"+i, error.getDefaultMessage());
                jsonValidated.put("code"+i,error.getCode());
                i++;
            }
        } else {
            logger.info("校验通过");
            logger.info("json查询的内容{}", student);
            List<Student> select = studentService.selectStudent(student, 1, 10);
            jsonValidated.put("data", select);
        }
        logger.info("校验完毕后json集合{}", jsonValidated);
        return jsonValidated;
    }
}