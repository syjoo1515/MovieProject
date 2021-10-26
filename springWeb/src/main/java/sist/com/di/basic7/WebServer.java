package sist.com.di.basic7;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;



@Component
public class WebServer {
	
	@Value("${mydb.serverName2}")
   private String serverName;
	@Value("${mydb.ip2}")
   private String serverIp;
	@Value("${mydb.port2}")
   private int serverPort;
	@Value("${mydb.url2}")
   private String serverUrl;
	
public String getServerName() {
   return serverName;
}
public void setServerName(String serverName) {
   this.serverName = serverName;
}
public String getServerIp() {
   return serverIp;
}
public void setServerIp(String serverIp) {
   this.serverIp = serverIp;
}
public int getServerPort() {
   return serverPort;
}
public void setServerPort(int serverPort) {
   this.serverPort = serverPort;
}
public String getServerUrl() {
   return serverUrl;
}
public void setServerUrl(String serverUrl) {
   this.serverUrl = serverUrl;
}
@Override
public String toString() {
   return "WebServer [serverName=" + serverName + ", serverIp=" + serverIp + ", serverPort=" + serverPort
         + ", serverUrl=" + serverUrl + "]";
}
   
   
   
}