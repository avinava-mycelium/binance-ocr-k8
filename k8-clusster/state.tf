terraform {
  backend "gcs" {
    bucket  = "backend-bucket-sdl"
    prefix  = "binance/binanace-ocr.tfstate"
  }
}