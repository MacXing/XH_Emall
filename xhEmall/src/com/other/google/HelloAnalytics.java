package com.other.google;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.analytics.Analytics;
import com.google.api.services.analytics.AnalyticsScopes;
import com.google.api.services.analytics.model.Accounts;
import com.google.api.services.analytics.model.GaData;
import com.google.api.services.analytics.model.Profiles;
import com.google.api.services.analytics.model.Webproperties;

import java.io.File;
import java.io.IOException;

/**
 * A simple example of how to access the Google Analytics API using a service
 * account.
 */
public class HelloAnalytics {
	//应用名称
  private static final String APPLICATION_NAME = "xhemall";
  
  private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
  
  private static final String KEY_FILE_LOCATION = "E:\\GitHub_workspace\\XH_Emall2\\xhEmall\\src\\com\\other\\google\\client_secrets.p12";
  private static final String SERVICE_ACCOUNT_EMAIL = "maczhouxing@gmail.com";
  
  public static void main(String[] args) {
    try {
      Analytics analytics = initializeAnalytics();

      String profile = getFirstProfileId(analytics);
      System.out.println("第一个配置文件ID: "+ profile);
      printResults(getResults(analytics, profile));
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private static Analytics initializeAnalytics() throws Exception {
    // 初始化授权的分析服务对象。

    // 使用服务帐户电子邮件构建GoogleCredential对象
    // 和从开发者控制台下载的p12文件
    HttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
    GoogleCredential credential = new GoogleCredential.Builder()
        .setTransport(httpTransport)
        .setJsonFactory(JSON_FACTORY)
        .setServiceAccountId(SERVICE_ACCOUNT_EMAIL)
        .setServiceAccountPrivateKeyFromP12File(new File(KEY_FILE_LOCATION))
        .setServiceAccountScopes(AnalyticsScopes.all())
        .build();

    //构建分析服务对象。
    return new Analytics.Builder(httpTransport, JSON_FACTORY, credential)
        .setApplicationName(APPLICATION_NAME).build();
  }

  private static String getFirstProfileId(Analytics analytics) throws IOException {
    // 获取授权用户的第一个视图（配置文件）ID。
    String profileId = null;

    // 查询与服务帐户关联的所有帐户的列表。
    Accounts accounts = analytics.management().accounts().list().execute();

    if (accounts.getItems().isEmpty()) {
      System.err.println("没有找到帐户");
    } else {
      String firstAccountId = accounts.getItems().get(0).getId();

      //      查询与第一个帐户关联的属性列表。
      Webproperties properties = analytics.management().webproperties()
          .list(firstAccountId).execute();

      if (properties.getItems().isEmpty()) {
        System.err.println("没有找到Webproperties");
      } else {
        String firstWebpropertyId = properties.getItems().get(0).getId();

   // 查询与该属性关联的列表视图（配置文件）。
        Profiles profiles = analytics.management().profiles()
            .list(firstAccountId, firstWebpropertyId).execute();

        if (profiles.getItems().isEmpty()) {
          System.err.println("未找到任何视图（配置文件）");
        } else {
          // 返回与属性关联的第一个（查看）配置文件。
          profileId = profiles.getItems().get(0).getId();
        }
      }
    }
    return profileId;
  }

  private static GaData getResults(Analytics analytics, String profileId) throws IOException {
    // 查询Core Reporting API的会话数量
    // 在过去七天。
    return analytics.data().ga()
        .get("ga:" + profileId, "7daysAgo", "today", "ga:sessions")
        .execute();
  }

  private static void printResults(GaData results) {
    // 	  解析来自Core Reporting API的响应
    // 	  配置文件名称和会话数量。
    if (results != null && !results.getRows().isEmpty()) {
      System.out.println("View (Profile) Name: "
        + results.getProfileInfo().getProfileName());
      System.out.println("Total Sessions: " + results.getRows().get(0).get(0));
    } else {
      System.out.println("No results found");
    }
  }
}