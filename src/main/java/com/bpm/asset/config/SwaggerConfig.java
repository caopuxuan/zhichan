package com.bpm.asset.config;

/*
 * 注：RestFull 接口文档说明
 * 注：下载示例项目将package名改为com.bpm.你的模块名称 如 ：com.bpm.billsCheck(单据调看模块)
 */
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;

/*
 * 注：请将下面所有XXX改为项目模块名称如:billsCheck (单据调看)
 */

@Configuration
@EnableSwagger2
public class SwaggerConfig {
	@Bean
    public Docket createAssetRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(assetInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.bpm.asset.controller"))
                .paths(PathSelectors.any())
                .build()
                .apiInfo(assetInfo());
    }

    private ApiInfo assetInfo() {
        return new ApiInfoBuilder()
                .title("艾图BPM系统资产微服务系统RESTful API")
                .contact(new Contact("研发人员张博宇", "", ""))
                .version("1.0")
                .description("艾图BPM系统资产模块API接口描述")
                .build();
    }
}
