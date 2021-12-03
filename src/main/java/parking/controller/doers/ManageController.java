package parking.controller.doers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManageController {

   //重定向首页
    @RequestMapping("/manage/index.shtml")

    public String index(){

        return "redirect:index";
    }


    //重定向关于我们
    @RequestMapping("/manage/about.shtml")

    public String about(){

        return "redirect:about";
    }


    //重定向产品
    @RequestMapping("/manage/product.shtml")

    public String product(){

        return "redirect:product";
    }


    //重定公司风采
    @RequestMapping("/manage/album_21805.shtml")

    public String album_21805(){

        return "redirect:album_21805";
    }

    //重定向业务中心

    @RequestMapping("/manage/group.shtml")

    public String group(){

        return "redirect:group";
    }


    //重定向新闻资讯

    @RequestMapping("/manage/news.shtml")

    public String news(){

        return "redirect:news";
    }

    //重定向联系我们

    @RequestMapping("/manage/contact.shtml")

    public String contact(){

        return "redirect:contact";
    }



}
