#' getNature
#'
#' Get the news from the Nature
#'
#' @param category which category of the news would you like to check?
#' Options: "news", "research" or "opinion" (default: "news", the latest Nature news)
#' @keywords news
#'
#' @return PeoplesDailyNews
#' @export
#'
#' @examples getNature()
#' @importFrom xml2 read_html
getNature <-
  function(category = "news"){
    if(category == "news"){
      # define the url variable
      url = 'https://www.nature.com/latest-news'
      # read the main website
      web = read_html(url)
      print(html_nodes(web,".c-featured.wrapper a h3") %>% html_text)
    } else {
      print("under development")
    }
  }
