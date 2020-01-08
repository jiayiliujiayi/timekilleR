#' getScience
#'
#' Get the news from the Science magazine.
#'
#' @param category default = "latest".  options: "latest", "insider"
#'
#' @return
#' @export
#'
#' @examples getScience()
#' @importFrom xml2 read_html

getScience <-
  function(category = "latest"){
    if(category == "latest"){
      # define the url variable
      url = 'https://www.sciencemag.org/news/latest-news'
      # read the main website
      web = read_html(url)
      print(html_nodes(web,".media__body h2 a") %>% html_text %>% gsub('\n', '', .)%>% gsub('  ', '', .))
    } else if (category == "insider"){
      # define the url variable
      url = 'https://www.sciencemag.org/news/scienceinsider'
      # read the main website
      web = read_html(url)
      print(html_nodes(web,".view-article-lists-page-1 h1 a") %>% html_text())
    }
  }

