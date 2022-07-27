package com.eston201.controllers;

import com.eston201.dao.IStudentDAO;
import com.eston201.entities.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private IStudentDAO studentDao;

    @GetMapping("students")
    public String getStudents(Model model) {
        model.addAttribute("students", studentDao.getStudents());
        return "list_students";
    }

    @GetMapping("addStudent")
    public String updateStudent(Model model) {
        model.addAttribute("student", new Student());
        return "add_student";
    }

    @PostMapping("saveStudent")
    public String saveStudent(@ModelAttribute("student") Student student) {
        studentDao.save(student);
        return "redirect:/student/students";
    }

    @GetMapping("updateStudent")
    public String updateStudent(@RequestParam("studentId") int id, Model model) {
        model.addAttribute("student", studentDao.getStudent(id));
        return "update_student";
    }

    @GetMapping("deleteStudent")
    public String deleteStudent(@RequestParam("studentId") int id) {
        studentDao.deleteStudent(id);
        return "redirect:/student/students";
    }
}
