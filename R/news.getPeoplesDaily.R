#' Title
#'
#' @param category
#'
#' @return PeoplesDailyNews
#' @export
#'
#' @examples
#' @importFrom rvest read_html
getPeoplesDaily <-
  function(category = "headline"){
    url = 'http://en.people.cn/'
    web = read_html(url)
    if(category == "headline"){
      print(html_nodes(web,".p1_1 b") %>% html_text %>% gsub('\n', '', .))
    } else if(category == "tophit"){
      print(html_nodes(web,".p1_3 ul a") %>% html_text)
    } else if(category == "latest"){
      print(html_nodes(web,".p1box a") %>% html_text %>% .[2:10])
    }
  }
