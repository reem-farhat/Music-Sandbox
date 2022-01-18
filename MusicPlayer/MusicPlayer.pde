//Libraries
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates object to access all functions
int numberOfSongs = 2;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
int currentSong = numberOfSongs - numberOfSongs; //current song is 0 


void setup() {
  fullScreen();
  population();
  textSetup();
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  song[currentSong] = minim.loadFile("Music/Sweet.mp3"); //able to pass absolute path, file name, and URL
  song[currentSong+1] = minim.loadFile("maxkomusic-christmas-is-coming.mp3");
  song[currentSong+2] = minim.loadFile("01-Monk-Turner-Fascinoma-Its-Your-Birthday.mp3");
  //song1.play(); //Parameter is milli-seconds from start of audio file to start playing
}//End setup()

void draw() {
  powerButtonDraw();
  //
  if ( .isLooping() ) {
    println ("Is Looping");
    println ( song[currentSong]. loopCount() );
  }
}//End draw()

void keyPressed() {
  //PlayPause
  if (key == 'p') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else {
      song[currentSong].play();
    }
  }
  //Play-Stop
  if (key =='s') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }
  }
  //FastForward
  if (key =='f') song[currentSong].skip(1000);
  //Fast Rewind
  if (key =='r') song[currentSong].skip(-1000);
  //Mute
  if (key =='m') { 
    if ( song[currentSong].isMuted() ) {
      song[currentSong].unmute();
    } else {
      song[currentSong].mute();
    }
  }
  //Loop Function
  int loopIntNum = 2; //Loop Hardcode
  if ( key == 'l' || key == 'L' ) song[currentSong].loop(loopIntNum); //Play Button

  //currentSong ++; // = currentSong + 1, += 1
  currentSong ++; // = currentSong + 1, += 1
  if ( key == 'l' || key == 'L') song[currentSong].loop(0); //Parameter is Parameter is number of repeats
  //
  if (key == 'n' || key == 'N') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong] .pause();
      song[currentSong] .rewind();
      //
      arrayFixError ();
      //
      song[currentSong] .play();
    } else {
      song[currentSong] .rewind();
      arrayFixError ();
    }
  } //End Next Button
 //start back button
  if (key == 'b' || key == 'B') { //Next Button to Console
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong); //For Debugging
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
        println ("Current Song after the next or back button, but not the first song", "\tNumber: " + currentSong); //For Debugging
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong); //For DebuggingcurrentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
        println ("Current Song after the next or back button, but not the first song, ", "Number: "+currentSong); //For Debugging
      }
    }
  }
//End back button()
}//End keyPressed()

void mousePressed() {
  powerButtonMousePressed();
}//End mousePressed()
