package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.dto.ChooseRecordsDto;
import com.example.demo.model.po.ChooseRecords;
import com.example.demo.model.po.Courses;
import com.example.demo.model.po.Students;
import com.example.demo.service.ChooseRecordsService;
import com.example.demo.service.StudentsService;

@Controller
@RequestMapping("/chooseRecords")
public class ChooseRecordsController {

    @Autowired
    private ChooseRecordsService chooseRecordsService;
    
    @Autowired
    private StudentsService studentsService;

    @GetMapping
    public String chooseRecords(@ModelAttribute ChooseRecords chooseRecords, 
    							@ModelAttribute Courses courses,
    							@ModelAttribute Students students,
    							Model model) {
        List<ChooseRecordsDto> chooseRecordsDtos = chooseRecordsService.findAllChooseRecords();
        List<Courses> course = chooseRecordsService.findAllCourses();
        List<Students> student = studentsService.findAllStudents();
        model.addAttribute("chooseRecordsDtos", chooseRecordsDtos);
        model.addAttribute("course", course);
        model.addAttribute("student", student);
    	return "chooseRecords";
    }
    

    @GetMapping("/{id}")
    public String getChooseRecordById(@PathVariable int id, Model model) {
        ChooseRecords chooseRecord = chooseRecordsService.getChooseRecordById(id);
        model.addAttribute("chooseRecord", chooseRecord);
       return "chooseRecords";
   }

    @GetMapping("/new")
    public String newChooseRecordForm(Model model) {
        model.addAttribute("chooseRecord", new ChooseRecords());
        return "chooseRecords";
    }

    
    @PostMapping
    public String addChooseRecord(@ModelAttribute ChooseRecords chooseRecord) {
 	   chooseRecordsService.addChooseRecord(chooseRecord);
        return "redirect:/chooseRecords";
    }

   @GetMapping("/delete/{id}")
   public String deleteChooseRecord(@PathVariable int id) {
	   chooseRecordsService.deleteChooseRecord(id);
      return "redirect:/chooseRecords";
    }
}
