import jwt from "jsonwebtoken";
import type { Request, Response, NextFunction } from "express";

declare global {
    namespace Express {
      interface Request {
        user?: any;
      }
    }
  }

    

export const authenticate = (req: Request, res: Response, next: NextFunction) => {
    const token = req.headers.authorization?.split(" ")[1];

    if (!token) {
        return res.status(401).json({ message: "Unauthorized" });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET as string);
        req.user = decoded;
        next();
      } catch {
        return res.status(401).json({ message: "Token inválido" });
      }
      
};

