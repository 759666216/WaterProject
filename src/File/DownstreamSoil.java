package File;

import java.sql.ResultSet;
import DBManage.DBManage;
import com.alibaba.fastjson.JSONObject;


public class DownstreamSoil {

        public static void soil(JSONObject job) {
            System.out.println(job);
            String datetime = job.getString("datetime");
            String temperature =job.getJSONObject("values").getJSONObject("地表").getString("temperature");
            String battery =job.getJSONObject("values").getJSONObject("地表").getString("battery");
            String onetemperature =job.getJSONObject("values").getJSONObject("10cm").getString("temperature");
            String onemoisture =job.getJSONObject("values").getJSONObject("10cm").getString("moisture");
            String twotemperature =job.getJSONObject("values").getJSONObject("20cm").getString("temperature");
            String twomoisture =job.getJSONObject("values").getJSONObject("20cm").getString("moisture");
            String threetemperature =job.getJSONObject("values").getJSONObject("30cm").getString("temperature");
            String threemoisture =job.getJSONObject("values").getJSONObject("30cm").getString("moisture");
            String foretemperature =job.getJSONObject("values").getJSONObject("40cm").getString("temperature");
            String foremoisture =job.getJSONObject("values").getJSONObject("40cm").getString("moisture");
            String fivetemperature =job.getJSONObject("values").getJSONObject("50cm").getString("temperature");
            String fivemoisture =job.getJSONObject("values").getJSONObject("50cm").getString("moisture");
            String sixtemperature =job.getJSONObject("values").getJSONObject("60cm").getString("temperature");
            String sixmoisture =job.getJSONObject("values").getJSONObject("60cm").getString("moisture");
            String seventemperature =job.getJSONObject("values").getJSONObject("70cm").getString("temperature");
            String sevenmoisture =job.getJSONObject("values").getJSONObject("70cm").getString("moisture");
            String eighttemperature =job.getJSONObject("values").getJSONObject("80cm").getString("temperature");
            String eightmoisture =job.getJSONObject("values").getJSONObject("80cm").getString("moisture");
            String ninetemperature =job.getJSONObject("values").getJSONObject("90cm").getString("temperature");
            String ninemoisture =job.getJSONObject("values").getJSONObject("90cm").getString("moisture");
            String tentemperature =job.getJSONObject("values").getJSONObject("100cm").getString("temperature");
            String tenmoisture =job.getJSONObject("values").getJSONObject("100cm").getString("moisture");

            String seacherSql = "select * from water where datetime = '"+ datetime +"' ORDER BY datetime DESC LIMIT 1";
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
                    String logSql = "insert into water(datetime,0temperature,battery,10temperature,10moisture,20temperature,20moisture,30temperature,30moisture,40temperature,40moisture,50temperature,50moisture,60temperature,60moisture,70temperature,70moisture,80temperature,80moisture,90temperature,90moisture,100temperature,100moisture) values ('"+datetime+"','"+temperature+"','"+battery+"','"+onetemperature+"','"+onemoisture+"','"+twotemperature+"','"+twomoisture+"','"+threetemperature+"','"+threemoisture+"','"+foretemperature+"','"+foremoisture+"','"+fivetemperature+"','"+fivemoisture+"','"+sixtemperature+"','"+sixmoisture+"','"+seventemperature+"','"+sevenmoisture+"','"+eighttemperature+"','"+eightmoisture+"','"+ninetemperature+"','"+ninemoisture+"','"+tentemperature+"','"+tenmoisture+"')";
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


