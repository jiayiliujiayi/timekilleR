#' getNature
#'
#' Get the news from the Nature
#'
#' @param category which category of the news would you like to check?
#' Options: ("news", "research" or "opinion"):
#' "news" (default), the latest Nature news.
#' "research": the latest research articles and review articles from the Nature journal.
#' "opinion": the latest opinion articles.
#'
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
    } else if (category == "research"){
      # define the url variable
      url = 'https://www.nature.com/nature/research'
      # read the main website
      web = read_html(url)
      print(html_nodes(web,".cleared h3 a") %>% html_text %>% gsub("  ", "", .) %>% gsub('\\\n', "", .))
    } else if (category == "opinion"){
      # define the url variable
      url = 'https://www.nature.com/opinion'
      # read the main website
      web = read_html(url)
      print(html_nodes(web,".cleared a h3") %>% html_text)
    }
  }
