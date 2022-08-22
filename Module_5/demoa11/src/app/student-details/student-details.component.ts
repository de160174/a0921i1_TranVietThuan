import { Component, OnInit } from '@angular/core';
import {Student} from '../student';



@Component({
  selector: 'app-student-details',
  templateUrl: './student-details.component.html',
  styleUrls: ['./student-details.component.css']
})
export class StudentDetailsComponent implements OnInit {
  student: Student = {
    id: 1,
    name: 'Viet Thuan',
    email: 'thuantvde160174@gmail.com',
    mark: 0,
    avatar: 'https://scontent.fsgn2-6.fna.fbcdn.net/v/t1.6435-9/121611282_2826986344292178_5097836099006478146_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=IiSITMudXhIAX9hbKR5&_nc_ht=scontent.fsgn2-6.fna&oh=00_AT-wYDI1qfehjThVMWjjtCyPTiHfpjicibC-D1TOElFX6Q&oe=632844EE'
  };
  constructor() { }

  ngOnInit(): void {
  }
  ChangeMark(target: any) {
    this.student.mark = target.value;
  }
}
