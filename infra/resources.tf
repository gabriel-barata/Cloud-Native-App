resource "aws_ecr_repository" "project-repo" {
  
    name = "${var.project-name}-repo"
    image_tag_mutability = "MUTABLE"
    force_delete = true

    image_scanning_configuration {
      
        scan_on_push = true
        
    }

}