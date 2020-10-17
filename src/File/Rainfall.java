package File;

import java.sql.ResultSet;

import DBManage.DBManage;
import com.alibaba.fastjson.JSONObject;


public class Rainfall {

        public static void rainfall(JSONObject job) {

            String datetime = job.getString("datetime");
            //风速
            String averageWindSpeed =job.getJSONObject("values").getJSONObject("地表").getString("averageWindSpeed");
            //雨量
            String rainfall =job.getJSONObject("values").getJSONObject("地表").getString("rainfall");
            //当前太阳辐射强度
            String solarRadiationIntensity =job.getJSONObject("values").getJSONObject("地表").getString("solarRadiationIntensity");
            //空气温度
            String airTemperature =job.getJSONObject("values").getJSONObject("地表").getString("airTemperature");
            //累计太阳辐射量
            String solarRadiationAmount =job.getJSONObject("values").getJSONObject("地表").getString("solarRadiationAmount");
            //相对湿度
            String relativeHumidity =job.getJSONObject("values").getJSONObject("地表").getString("relativeHumidity");
            //外部输入电压
            String outsideVoltage =job.getJSONObject("values").getJSONObject("地表").getString("outsideVoltage");
            //风向
            String windDirection =job.getJSONObject("values").getJSONObject("地表").getString("windDirection");
            //电池电量
            String battery =job.getJSONObject("values").getJSONObject("地表").getString("battery");
            //大气压力
            String atmosphericPressure =job.getJSONObject("values").getJSONObject("地表").getString("atmosphericPressure");
            //数据库表命名为data
            String seacherSql = "select * from rainfall where datetime = '"+ datetime +"' ORDER BY datetime DESC LIMIT 1";
            //获取DB对象

            DBManage sqlDbManage = DBManage.creatInstance();
            sqlDbManage.connectDB();
            //操作DB对象查询
            try {
                ResultSet ret = sqlDbManage.excuteQuery(seacherSql);
                if(ret.next()){
                    sqlDbManage.closeDB();
                }
                else {
                    String logSql = "insert into rainfall(datetime,averageWindSpeed,rainfall,solarRadiationIntensity,airTemperature,solarRadiationAmount,relativeHumidity,outsideVoltage,windDirection,battery,atmosphericPressure) values ('"+datetime+"','"+averageWindSpeed+"','"+rainfall+"','"+solarRadiationIntensity+"','"+airTemperature+"','"+solarRadiationAmount+"','"+relativeHumidity+"','"+outsideVoltage+"','"+windDirection+"','"+battery+"','"+atmosphericPressure+"')";
                    sqlDbManage.executeUpdate(logSql);
                    System.out.println(datetime);
                    sqlDbManage.closeDB();

                }
            }

            catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
            sqlDbManage.closeDB();

        }

}
