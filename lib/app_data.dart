//import 'package:flutter/material.dart';
//import './models/category.dart';
//import './models/store.dart';

//انشاء الاقسام
/*const Categories_data = [
  Category(
      id: 'c1',
      title: 'القسم الاول',
      imageUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNvbXB1dGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
  Category(
      id: 'c2',
      title: 'القسم الثاني ',
      imageUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNvbXB1dGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
  Category(
    id: 'c3',
    title: 'القسم الثالث',
    imageUrl:
        'https://images.unsplash.com/photo-1547394765-185e1e68f34e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNvbXB1dGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ),
  Category(
    id: 'c4',
    title: 'القسم الرابع',
    imageUrl:
        'https://images.unsplash.com/photo-1551739440-5dd934d3a94a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGNvbXB1dGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ),
  Category(
    id: 'c5',
    title: 'القسم الخامس',
    imageUrl:
        'https://images.unsplash.com/photo-1531771686035-25f47595c87a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fGNvbXB1dGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ),
  Category(
    id: 'c6',
    title: 'القسم السادس',
    imageUrl:
        'https://images.unsplash.com/photo-1566647387313-9fda80664848?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzB8fGNvbXB1dGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ),
  Category(
    id: 'c7',
    title: 'القسم السابع',
    imageUrl:
        'https://images.unsplash.com/photo-1566647387313-9fda80664848?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzB8fGNvbXB1dGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ),
  Category(
    id: 'c8',
    title: 'القسم الثامن',
    imageUrl:
        'https://images.unsplash.com/photo-1566647387313-9fda80664848?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzB8fGNvbXB1dGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ),
];*/
//نهاية الاقسام

//المتاجر بمعلوماتها
/*
const Stores_data = [
  Store(
    id: 'm1',
    categories: [
      'c1',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 1',
    copoun: 'B50',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1611523658822-385aa008324c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8bW91bmF0aW5zfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm2',
    categories: [
      'c1',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 1',
    copoun: 'B50',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm3',
    categories: [
      'c2',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 2',
    copoun: 'B50',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1611523658822-385aa008324c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8bW91bmF0aW5zfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm4',
    categories: [
      'c2',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 2',
    copoun: 'B50',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm5',
    categories: [
      'c3',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر نون',
    copoun: 'B50',
    Specialization:
        'متخصص في بيع \nالملابس ولجوالات  واشياء  كثيرة جدا من المنتجات',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/ar/d/d5/Noon_log.jpeg',
  ),
  Store(
    id: 'm6',
    categories: [
      'c3',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 3',
    copoun: 'AsDs525',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm6',
    categories: [
      'c3',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 3',
    copoun: 'QWER989',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm6',
    categories: [
      'c3',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 3',
    copoun: 'B50',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm6',
    categories: [
      'c3',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 3',
    copoun: 'B50',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm6',
    categories: [
      'c3',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 3',
    copoun: 'B50',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm6',
    categories: [
      'c3',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 3',
    copoun: 'B50',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
  Store(
    id: 'm6',
    categories: [
      'c3',
    ],
    SiteUrl: 'https://www.noon.com/',
    title: 'متجر القسم 3',
    copoun: 'B50',
    Specialization: 'متخصص',
    discount: 'خصم 10% عند استخدام الكود',
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ),
];
*/
