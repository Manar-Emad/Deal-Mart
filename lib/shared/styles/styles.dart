import 'package:flutter/material.dart';
import 'colors.dart';

///Primary Color Bold Text Style
TextStyle prim18bold() => const TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);
TextStyle prim20bold() => const TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);
TextStyle prim24bold() => const TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

///MaxLines Style
Text txtMaxLines1(String txt) =>  Text(txt,
  maxLines: 1 ,overflow: TextOverflow.ellipsis,
);

Text txtMaxLinesB1(String txt) =>  Text(txt,style: const TextStyle(
    fontWeight: FontWeight.bold,fontSize: 12),
  maxLines: 1 ,overflow: TextOverflow.ellipsis,
);

///Primary Color Bold TextStyle
TextStyle prim10bold() => const TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.bold,  color: primaryColor
);
TextStyle prim12bold() => const TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.bold,  color: primaryColor
);
TextStyle prim14bold() => const TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: primaryColor
);
TextStyle prim16bold() => const TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,  color: primaryColor
);



///Black Bold TextStyle
TextStyle black10bold() => const TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
  color: Colors.black87,
    );
TextStyle black12bold() => const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
  color: Colors.black
    );
TextStyle black14bold() => const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    );
TextStyle black16bold() => const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );
TextStyle black18bold() => const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
TextStyle black20bold() => const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
TextStyle black22bold() => const TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);


///Black Regular TextStyle
TextStyle black10regular() => const TextStyle(
      fontSize: 10.0,color: Colors.black87,
    );
TextStyle black12regular() => const TextStyle(
      fontSize: 12.0,
  color: Color(0xff1E1E1E),
    );
TextStyle black14regular() => const TextStyle(
      fontSize: 14.0,
    );
TextStyle black16regular() => const TextStyle(
      fontSize: 16.0,
    );
TextStyle black18regular() => const TextStyle(
      fontSize: 18.0,
    );
TextStyle black20regular() => const TextStyle(
      fontSize: 20.0,
    );

///Grey Bold Text Style
TextStyle grey10bold() => const TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);
TextStyle grey12bold() => const TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);
TextStyle grey14bold() => const TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);
TextStyle grey16bold() => const TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);


TextStyle grey12regular() => const TextStyle(
  fontSize: 12.0,
  color: Colors.grey,
);

///White Bold Text Style
TextStyle white7bold() => const TextStyle(
      fontSize: 7.0,
       fontWeight: FontWeight.bold,
       color: Colors.white,
     );
TextStyle white9bold() => const TextStyle(
  fontSize: 9.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
TextStyle white10bold() => const TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
TextStyle white12bold() => const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
TextStyle white14bold() => const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
TextStyle white16bold() => const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
TextStyle white18bold() => const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
TextStyle white20bold() => const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
TextStyle white22bold() => const TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

///White Regular Text Style
TextStyle white10regular() => const TextStyle(
      fontSize: 10.0,
      color: Colors.white,
    );
TextStyle white12regular() => const TextStyle(
      fontSize: 12.0,
      color: Colors.white,
    );
TextStyle white14regular() => const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    );
TextStyle white16regular() => const TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    );
TextStyle white18regular() => const TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    );
TextStyle white20regular() => const TextStyle(
      fontSize: 20.0,
      color: Colors.white,
    );


TextStyle visa20bold() => const TextStyle(
  fontSize: 20,color: Color(0xff1434CB),
  fontWeight: FontWeight.bold,
);


TextStyle red12bold() => const TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  color: Colors.red,
);
TextStyle red14bold() => const TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: Colors.red,
);