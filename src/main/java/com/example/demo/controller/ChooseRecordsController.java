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
import com.example.demo.service.ChooseRecordsService;

@Controller
@RequestMapping("/chooseRecords")
public class ChooseRecordsController {

    @Autowired
    private ChooseRecordsService chooseRecordsService;

    @GetMapping
    public String chooseRecords(@ModelAttribute ChooseRecords chooseRecords, 
    							@ModelAttribute Courses courses,
    							Model model) {
        List<ChooseRecordsDto> chooseRecordsDtos = chooseRecordsService.findAllChooseRecords();
        List<Courses> course = chooseRecordsService.findAllCourses();
        model.addAttribute("chooseRecords", chooseRecords);
        model.addAttribute("courses", courses);
    	return "chooseRecords";
    }
    
    /* 待處理
    @GetMapping
    public String Courses(@ModelAttribute Courses courses, Model model) {
        List<Courses> courses = chooseRecordsService.findAllCourses();
        model.addAttribute("courses", courses);
 
    	return "chooseRecords";
    }
    */
    

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
