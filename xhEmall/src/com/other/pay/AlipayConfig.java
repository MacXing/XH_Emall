package com.other.pay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016082100308021";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCFdGidA4uHMcoplqRSYhuek09khLzRt7JA7nhJxHEO02hukHdZ70GQKXCeJbdW+LwWl5RZKNTjEq/jkzXTVdXEEpXLAXHCaBxrLHVRKHSwhclyxT8XQJltmIGv+7x97VF7gT7bP3w6lHJG/Zs5yGOCuKZx8hydim9Z83v820KYAALr4n/Gr2yDDO9tI497Q8b5PirGjEyJ+Dk6f18+XfNTK6KyX6HMvcOisuFn2b5L8dkDNpA2x5c/SWQmZ7k+yvKrvTsyC3jOvKCn9PZRHGtBHFdOYVy/erurauMtzJH9ClzCmbJiBjOKC0Vj8ly08gjnnwPeEuCMMrQ8o/baAKxHAgMBAAECggEAc68HCCSMjLMCVa653pgg7QMxLSdLLlgYcuTE7N0WTA3CVyVv8EvP/5GMh+qV1RRkpwjalbcpY3VNdu6jGAEt/ntF0eX8oNLy34x4XdO9407140FMgXGEDlbHBLApItfXbEILJK8Rlw4bSaKJLjug1y4NSnTfjUj1YXoJHpVKUste7+pCaPtZKzLhFkD7860yytkFuFTiqky25BnD8klHeLZd/YS0Ict0tu2Fd3vTYIE+ubxTqOL+jE2moaWG8JsDpq2cZXOR4bEw7HFJyfTqxnLXfRVjjD8xN9kADYCQwhGgZodYejJPd9ZT0OrNasvR2aEs5sVAv+0hq8wer6BEoQKBgQDBrPp3ENLltkKew7YWc//8oKNtnZc7LPh7Ghcm0B9cYhS0J0bTP+hlucfAWlThQS3jH9XMdGGhKMnmuAbquPMPX5hD/pj5BiBBFnZYGXLdpYHsnLdcwx06gtBXWn1QmFGJfAwOmYEXjlnYKZ2h7sLWtuzIMb6H6J6uWyzeYLC3vwKBgQCwZmu5IiprwEDx/5rU7QPmEX8mKuIcLEVuU4Xl++yoeJorK8JzXlJiyvpXJnpQoDeH/pBfFZSoVxlEGMkmmfNNgImROpE5y8BZMror7KFNrQ/naxVPFMSL/KhjzHUSGh1idyiowp9KyM827ATCm5qPHI7EOxPmaMWvA5sCGyLteQKBgQC7TeQIxH+B4wt46cOu4U6fbme/ehopA6vnuerMAZliygRF2npXkUXbI5m4QGQ4WMXdEwu8qI1Gw+DHPhCKboW6x3PFxnMA2tjUubmIKEx7aTZGs6Vtk9EvphWBdaUeDcFFWm96qyA6vNPNBypI0lUiPFSwo9MlM2ZLLygshIxDlwKBgFNco43C+p8fJNH4RDhZpd0E6bykyWQc+9bOe9mau1VGYT0DmgohSffMCpBC68zMWlHXWGzG6xC+0H7g47ZtTJCUrO5H6jeQ9V5x3Y9CbVwi7AAmF9TecJ/jD8TR64VZeAd/XmSaTOLvkRVYZkt9c4YsLb/IV3gsjTdPEeLl5hSpAoGAAMPQBk2+yrCIL0ikBnEEoHwb8k4WL6j/n3+pz5vOO0m9sThCD0JBcTCWqus9r7Vhlwnly9Ej1udmmnWzCNkZ8qEmpzIp9J7wmRUQCOhRKN9OJ8YbqyRKtYpaWmpGOTPMTOip4LgOS9fmj9n2OF4BoySLcwScvDSnlydggBGtdd4=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx/pT5kRhcKEsi0aabzyIixMuh/GmK6Lg+dNVXQXtTdHUJVF9ESbeWMUXllByZ9/OmqqpSzyBpeMjw9eZt9AqwKdBWPS5m0vjj0fbZjoFcqTk0jomJZ1efimusmk8/BpZD7LQ7JxddcK1sDVdEUi36xYt7y0I+3PjNg713AKWQi+Nq52QKSCCRXhYdmFKaFrFs8tlIMQrR5mukQUGHw52BACDFRGZSTi6YHMkBgvOaMwapvUZpZ1RT8FPu1HqVB1pg/34vw6ytF3Us3m3vdpPc9NJ3vRQdh6pgaO/KMS6gCBc1gmhMmPkzPidNHvFpfQ0cJ2vHQeYtK28Y7+a4IWgrQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://127.0.0.1:8080/xhEmall/home/home.action";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

