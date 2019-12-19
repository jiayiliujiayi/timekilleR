#' get the news from the People's Daily
#'
#' @param category which category of the news would you like to check?
#' Defaluts to "headline", could be "headline", "tophit" or "latest"
#' @keywords news
#'
#' @return PeoplesDailyNews
#' @export
#'
#' @examples getPeoplesDaily()
#' @importFrom xml2 read_html
getPeoplesDaily <-
  function(category = "headline"){
    # define the url variable as the main website of the People's Daily
    url = 'http://en.people.cn/'
    # read the main website
    web = read_html(url)
    if(category == "headline"){
      print(html_nodes(web,".p1_1 b") %>% html_text %>% gsub('\n', '', .))
    } else if(category == "tophit"){
      print(html_nodes(web,".p1_3 ul a") %>% html_text)
    } else if(category == "latest"){
      print(html_nodes(web,".p1box a") %>% html_text %>% .[2:10])
    }
  }
