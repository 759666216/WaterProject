package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class scanboardController {

    @RequestMapping("/scanboard")
    public String home(){
        return "scanboard";
    }

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 获取最近一次的0温度
     */
    @RequestMapping(value = "/get0NewTemperature", method = RequestMethod.GET)
    @ResponseBody
    public void get0NewTemperature() {
        List<Map<String, Object>> maps = jdbcTemplate.queryForList("select  water.0temperature from water " +
                "ORDER BY datetime LIMIT 1,1");
        maps.forEach(System.out::println);
    }

    /**
     * 获取最近一次的10温度
     */
    @RequestMapping(value = "/get10NewTemperature", method = RequestMethod.GET)
    @ResponseBody
    public Object get10NewTemperature() {
       String sql = "select  water.0temperature from water ORDER BY datetime DESC LIMIT 0,1";
       String Temperature = jdbcTemplate.queryForObject(sql,String.class);
       Map<String, Object> map = new HashMap<>();
       map.put("Temperature",Temperature);
       return map;
    }

    /**
     * 获取最近一次的10湿度
     */
    @RequestMapping(value = "/get20moisture", method = RequestMethod.GET)
    @ResponseBody
    public Object get10Moisture() {
        String sql = "select  water.20moisture from water ORDER BY datetime DESC LIMIT 0,1";
        String Moisture = jdbcTemplate.queryForObject(sql,String.class);
        Map<String, Object> map = new HashMap<>();
        map.put("Moisture",Moisture);
        return map;
    }

    /**
     * 获取当前平均风速
     */
    @RequestMapping(value = "/getAverageWindSpeed", method = RequestMethod.GET)
    @ResponseBody
    public Object getAverageWindSpeed() {
        String sql = "select rainfall.averageWindSpeed from rainfall ORDER BY  datetime DESC LIMIT 0,1";
        String AverageWindSpeed = jdbcTemplate.queryForObject(sql,String.class);
        Map<String, Object> map = new HashMap<>();
        map.put("AverageWindSpeed",AverageWindSpeed);
        return map;
    }

    /**
     * 获取当前降雨
     */
    @RequestMapping(value = "/getRainfall", method = RequestMethod.GET)
    @ResponseBody
    public Object getRainfall() {
        String sql = "select rainfall.rainfall from rainfall ORDER BY  datetime DESC LIMIT 0,1";
        String Rainfall = jdbcTemplate.queryForObject(sql,String.class);
        Map<String, Object> map = new HashMap<>();
        map.put("Rainfall",Rainfall);
        return map;
    }

    /**
     * 获取太阳辐射强度
     */
    @RequestMapping(value = "/getSolarRadiationIntensity", method = RequestMethod.GET)
    @ResponseBody
    public Object getSolarRadiationIntensity() {
        String sql = "select rainfall.solarRadiationIntensity from rainfall ORDER BY datetime DESC LIMIT 1,1";
        String SolarRadiationIntensity = jdbcTemplate.queryForObject(sql,String.class);
        Map<String, Object> map = new HashMap<>();
        map.put("SolarRadiationIntensity",SolarRadiationIntensity);
        return map;
    }

    /**
     * 获取相当湿度
     */
    @RequestMapping(value = "/getRelativeHumidity", method = RequestMethod.GET)
    @ResponseBody
    public Object getRelativeHumidity() {
        String sql = "select rainfall.relativeHumidity from rainfall ORDER BY datetime DESC LIMIT 1,1";
        String RelativeHumidity = jdbcTemplate.queryForObject(sql,String.class);
        Map<String, Object> map = new HashMap<>();
        map.put("RelativeHumidity",RelativeHumidity);
        return map;
    }

}
