#' write.gmt
#' write out self-curating gmt files.
#'
#' @param geneSet a list element, with names as geneset names.
#' @param gmt_file output /gmt file.  default: "gs.gmt"
#'
#' @return
#' @export
#'
#' @examples
write.gmt <- function(geneSet=gslist,gmt_file='gs.gmt'){
  sink( gmt_file )
  for (i in 1:length(geneSet)){
    cat(names(geneSet)[i])
    cat('\tNA\t')
    cat(paste(geneSet[[i]],collapse = '\t'))
    cat('\n')
  }
  sink()
}
