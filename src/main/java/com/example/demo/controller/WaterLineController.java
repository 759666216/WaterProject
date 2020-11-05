package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/College")
public class WaterLineController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 获取相当湿度
     */
    @RequestMapping(value = "/getCollegeWater", method = RequestMethod.GET)
    @ResponseBody
    public Object getCollege() {
        String sql = "SELECT datetime,cm FROM college ORDER BY datetime ASC";
        List<Map<String,Object>>list = jdbcTemplate.queryForList(sql);
        return list;
    }

}
