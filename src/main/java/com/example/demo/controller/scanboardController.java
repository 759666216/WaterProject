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

    private static final int Maxlength = 4;

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
        if(Temperature.length()>Maxlength){
            Temperature = Temperature.substring(0,5);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("Temperature",Temperature);
        return map;
    }


    /**
     * 获取最近十五次的10温度
     */
    @RequestMapping(value = "/get1510NewTemperature", method = RequestMethod.GET)
    @ResponseBody
    public Object get1510NewTemperature() {
        String sql = "select A.0temperature ,A.datetime FROM (select  water.0temperature,water.datetime from water ORDER BY datetime DESC LIMIT 0,15) AS A ORDER BY A.datetime ASC ";
        List<Map<String,Object>>list = jdbcTemplate.queryForList(sql);
        return list;
    }

    /**
     * 获取最近一次的10湿度
     */
    @RequestMapping(value = "/get20moisture", method = RequestMethod.GET)
    @ResponseBody
    public Object get10Moisture() {
        String sql = "select  water.20moisture from water ORDER BY datetime DESC LIMIT 0,1";
        String Moisture = jdbcTemplate.queryForObject(sql,String.class);
        if(Moisture.length()>Maxlength){
            Moisture = Moisture.substring(0,5);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("Moisture",Moisture);
        return map;
    }

    /**
     * 获取最近一次的10湿度
     */
    @RequestMapping(value = "/get1520moisture", method = RequestMethod.GET)
    @ResponseBody
    public Object get1510Moisture() {
        String sql = "select A.20moisture,A.datetime FROM (select  water.20moisture,water.datetime from water ORDER BY datetime DESC LIMIT 0,15) AS A ORDER BY A.datetime ASC";
        List<Map<String,Object>>list = jdbcTemplate.queryForList(sql);
        return list;
    }

    /**
     * 获取当前平均风速
     */
    @RequestMapping(value = "/getAverageWindSpeed", method = RequestMethod.GET)
    @ResponseBody
    public Object getAverageWindSpeed() {
        String sql = "select rainfall.averageWindSpeed from rainfall ORDER BY  datetime DESC LIMIT 0,1";
        String AverageWindSpeed = jdbcTemplate.queryForObject(sql,String.class);
        if(AverageWindSpeed.length()>Maxlength){
            AverageWindSpeed = AverageWindSpeed.substring(0,5);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("AverageWindSpeed",AverageWindSpeed);
        return map;
    }

    /**
     * 获取近15次平均风速
     */
    @RequestMapping(value = "/get15AverageWindSpeed", method = RequestMethod.GET)
    @ResponseBody
    public Object get15AverageWindSpeed() {
        String sql = "select A.averageWindSpeed,A.datetime FROM (select rainfall.averageWindSpeed,rainfall.datetime from rainfall ORDER BY  datetime DESC LIMIT 0,15) AS A ORDER BY A.datetime ASC";
        List<Map<String,Object>>list = jdbcTemplate.queryForList(sql);
        return list;
    }

    /**
     * 获取当前降雨
     */
    @RequestMapping(value = "/getRainfall", method = RequestMethod.GET)
    @ResponseBody
    public Object getRainfall() {
        String sql = "select rainfall.rainfall from rainfall ORDER BY  datetime DESC LIMIT 0,1";
        String Rainfall = jdbcTemplate.queryForObject(sql,String.class);
        if(Rainfall.length()>Maxlength){
            Rainfall = Rainfall.substring(0,5);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("Rainfall",Rainfall);
        return map;
    }

    /**
     * 获取近15次降雨
     */
    @RequestMapping(value = "/get15Rainfall", method = RequestMethod.GET)
    @ResponseBody
    public Object get15Rainfall() {
        String sql = "SELECT A.rainfall ,A.datetime FROM (select rainfall.rainfall ,rainfall.datetime from rainfall ORDER BY datetime DESC LIMIT 0,15) AS A ORDER BY A.datetime ASC";
        List<Map<String,Object>>list = jdbcTemplate.queryForList(sql);
        return list;
    }

    /**
     * 获取太阳辐射强度
     */
    @RequestMapping(value = "/getSolarRadiationIntensity", method = RequestMethod.GET)
    @ResponseBody
    public Object getSolarRadiationIntensity() {
        String sql = "select rainfall.solarRadiationIntensity from rainfall ORDER BY datetime DESC LIMIT 0,1";
        String SolarRadiationIntensity = jdbcTemplate.queryForObject(sql,String.class);
        if(SolarRadiationIntensity.length()>Maxlength){
            SolarRadiationIntensity = SolarRadiationIntensity.substring(0,5);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("SolarRadiationIntensity",SolarRadiationIntensity);
        return map;
    }

    /**
     * 获取近15次太阳辐射强度
     */
    @RequestMapping(value = "/get15SolarRadiationIntensity", method = RequestMethod.GET)
    @ResponseBody
    public Object get15SolarRadiationIntensity() {
        String sql = "SELECT A.datetime ,A.solarRadiationIntensity FROM (select rainfall.datetime,rainfall.solarRadiationIntensity from rainfall ORDER BY datetime DESC LIMIT 0,15) AS A ORDER BY A.datetime ASC";
        List<Map<String,Object>>list = jdbcTemplate.queryForList(sql);
        return list;
    }

    /**
     * 获取相当湿度
     */
    @RequestMapping(value = "/getRelativeHumidity", method = RequestMethod.GET)
    @ResponseBody
    public Object getRelativeHumidity() {
        String sql = "select rainfall.relativeHumidity from rainfall ORDER BY datetime DESC LIMIT 0,1";
        String RelativeHumidity = jdbcTemplate.queryForObject(sql,String.class);
        if(RelativeHumidity.length()>Maxlength){
            RelativeHumidity = RelativeHumidity.substring(0,5);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("RelativeHumidity",RelativeHumidity);
        return map;
    }

    /**
     * 获取相当湿度
     */
    @RequestMapping(value = "/get15RelativeHumidity", method = RequestMethod.GET)
    @ResponseBody
    public Object get15RelativeHumidity() {
        String sql = "SELECT A.relativeHumidity,A.datetime FROM (select rainfall.relativeHumidity,rainfall.datetime from rainfall ORDER BY datetime DESC LIMIT 0,15) AS A ORDER BY A.datetime ASC";
        List<Map<String,Object>>list = jdbcTemplate.queryForList(sql);
        return list;
    }


}
