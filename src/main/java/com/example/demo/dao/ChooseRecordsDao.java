package com.example.demo.dao;

import java.util.List;

import com.example.demo.model.dto.ChooseRecordsDto;
import com.example.demo.model.po.ChooseRecords;

public interface ChooseRecordsDao extends CoursesDao {
    int addChooseRecord(ChooseRecords chooseRecord);
    int updateChooseRecord(Integer id, ChooseRecords chooseRecord);
    int deleteChooseRecord(Integer id);
    ChooseRecords getChooseRecordById(Integer id);
    List<ChooseRecordsDto> findAllChooseRecords();
}